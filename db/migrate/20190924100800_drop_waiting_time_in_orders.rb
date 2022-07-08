class DropWaitingTimeInOrders < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :waiting_time
  end
end
