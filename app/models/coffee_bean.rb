# == Schema Information
#
# Table name: coffee_beans
#
#  id                        :bigint           not null, primary key
#  area                      :string
#  available_at              :string
#  description               :string
#  elevation                 :string
#  image                     :string
#  is_recommendation         :boolean          default(FALSE)
#  kind_of_coffee            :string
#  name                      :string
#  notes                     :string
#  orders_count              :integer          default(0), not null
#  process                   :string
#  slug                      :string
#  stock                     :integer          default(0)
#  stock_available           :integer          default(0)
#  varietas                  :string
#  visible                   :boolean          default(TRUE)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  serving_recommendation_id :integer
#
# Indexes
#
#  index_coffee_beans_on_slug  (slug) UNIQUE
#

class CoffeeBean < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :image, ImageUploader
  
  has_many :orders
  belongs_to :recommendation, class_name: 'ServingType', foreign_key: :serving_recommendation_id, optional: true

  # validates_presence_of :stock
  validates :stock, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validates_presence_of :image

  scope :visible, -> { where(visible: true) }
  scope :current_fav, -> { order(orders_count: :desc) }
  scope :available, -> { where.not(stock: 0) }

  def should_generate_new_friendly_id?
    name_changed?
  end

  def available?
    return false if stock.nil?
    stock > 0
  end

end



