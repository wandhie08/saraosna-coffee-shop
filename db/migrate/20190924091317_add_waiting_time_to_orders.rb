class AddWaitingTimeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :waiting_time, :time
  end
end
