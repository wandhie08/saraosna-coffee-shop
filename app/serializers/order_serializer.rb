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

class OrderSerializer < ApplicationSerializer
  attributes :coffe_name, :status, :serving_method_id, :serving_type_id, :coffee_bean_id, :queue_number, :order_number, :queueing_time

  attribute :coffee_bean do |object|
    object.coffee_bean.name
  end
  
  attribute :coffe_name do |object|
    object.name
  end

  attribute :serving_method do |object|
    object.serving_method.name
  end

  attribute :serving_type do |object|
    object.serving_type.name
  end

  attribute :background_color do |object|
    object.serving_type.color
  end

  attribute :queueing_time do |object|
    object.queuing_time.present? ? time_diff(object.created_at, object.queuing_time) : " "
  end

  attribute :serving_time do |object|
    object.serving_time.present? ? time_diff(object.created_at, object.serving_time) : " "
  end

end
