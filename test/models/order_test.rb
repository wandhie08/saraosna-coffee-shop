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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
