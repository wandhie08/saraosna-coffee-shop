class AddServingTimeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :serving_time, :datetime
  end
end
