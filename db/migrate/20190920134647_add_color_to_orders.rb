class AddColorToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :color, :string
  end
end
