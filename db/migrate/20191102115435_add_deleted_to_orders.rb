class AddDeletedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :deleted, :boolean, default: false
  end
end
