# == Schema Information
#
# Table name: orders
#
#  id                :bigint           not null, primary key
#  color             :string
#  deleted           :boolean          default(FALSE)
#  mobile_phone      :string
#  order_number      :integer
#  queue_number      :integer
#  queuing_time      :datetime
#  serving_time      :datetime
#  status            :integer          default("pending")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  coffee_bean_id    :bigint
#  serving_method_id :bigint
#  serving_type_id   :bigint
#
# Indexes
#
#  index_orders_on_coffee_bean_id     (coffee_bean_id)
#  index_orders_on_serving_method_id  (serving_method_id)
#  index_orders_on_serving_type_id    (serving_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (coffee_bean_id => coffee_beans.id)
#  fk_rails_...  (serving_method_id => serving_methods.id)
#  fk_rails_...  (serving_type_id => serving_types.id)
#

class Order < ApplicationRecord
  # include TimeHelper
  belongs_to :serving_method
  belongs_to :serving_type, counter_cache: true
  belongs_to :coffee_bean
  
  counter_culture :coffee_bean
  
  FIRST_QUEUE = 0
  ORDER_COLOR = %w(#FF9052 #8D5D3A #A67856 #5F5C58 #FFBA5C #77D353 #00A6FF #5A6978 #47525E #47525E #343F4B #8190A5 #8492A6 #E5E9F2 #976DD0 #D4595C)

  validates_uniqueness_of :queue_number
  validates :mobile_phone, phone: true
  # validates :mobile_phone,:presence => true,
  #                         :numericality => true,
  #                         :length => { :minimum => 10, :maximum => 15 }

  enum status: { pending: 0, processing: 1, done: 2, delivered: 3, canceled: 4, deleted: 5 }, _prefix: true
  
  # before_create :generate_order_number
  after_create :generate_queue_number

  after_create_commit { OrderBroadcastJob.perform_later(self, 'create') }  
  after_update_commit { OrderBroadcastJob.perform_later(self, 'update') }  
  after_destroy { OrderBroadcastJob.perform_later(self, 'destroy') }

  scope :latest, -> {order(queue_number: :asc)}
  scope :not_deleted, -> {where(deleted: false)}
  scope :by_serving_time, -> {order(serving_time: :asc)}
  scope :excepts, -> (orders) { where.not(id: orders) }


  def generate_queue_number
    update_column(:queue_number, self.id)
  end

  def update_wating_time_and_status(status)
    self.update(status: status, queuing_time: Time.current)
  end

  def confirm_done!
    # id.to_s.play("en", 1) if Rails.env.development?
    self.update!(status: 2, serving_time: Time.current)
  end

  def name
    "#{coffee_bean.name} - #{serving_type.name.titleize}"
  end

  def delete!
    update(deleted: true)
  end

  def self.pending_all!
    update_all(status: 0)
  end

  def queueing_time_duration
    time_diff(self.created_at, self.queuing_time)
  end

  def serving_time_duration
    time_diff(self.created_at, self.serving_time)
  end

  def self.to_csv
    attributes = %w{mobile_phone}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |order|
        csv << attributes.map{ |attr| order.send(attr) }
      end
    end
  end

  private
    ransacker :queue_number do
      Arel.sql("to_char(\"#{table_name}\".\"queue_number\", '99999')")
    end

  protected

    def generate_order_number
      self.order_number = loop do
        unique_number = SecureRandom.random_number(1..100000)
        break unique_number unless self.class.exists?(order_number: unique_number)
      end
    end

    def time_diff(start_time, end_time)
      seconds_diff = (start_time - end_time).to_i.abs
      hours = seconds_diff / 3600
      seconds_diff -= hours * 3600
      minutes = seconds_diff / 60
      seconds_diff -= minutes * 60
      seconds = seconds_diff
      "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
    end

end
