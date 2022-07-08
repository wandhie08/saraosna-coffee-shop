class AddVisibleToCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_beans, :visible, :boolean, default: true
    add_column :coffee_beans, :stock, :integer, default: 0
    add_column :coffee_beans, :stock_available, :integer, default: 0
  end
end
