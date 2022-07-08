class AddFieldsToCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_beans, :kind_of_coffee, :string
    add_column :coffee_beans, :area, :string
    add_column :coffee_beans, :elevation, :string
    add_column :coffee_beans, :varietas, :string
    add_column :coffee_beans, :process, :string
    add_column :coffee_beans, :notes, :string
  end
end
