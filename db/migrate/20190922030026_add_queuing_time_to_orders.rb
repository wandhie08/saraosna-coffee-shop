class AddQueuingTimeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :queuing_time, :datetime
  end
end
