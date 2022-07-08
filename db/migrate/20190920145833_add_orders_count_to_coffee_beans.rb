class AddOrdersCountToCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_beans, :orders_count, :integer, null: false, default: 0
  end
end
