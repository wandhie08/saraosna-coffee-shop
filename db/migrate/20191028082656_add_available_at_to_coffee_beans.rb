class AddAvailableAtToCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_beans, :available_at, :string
  end
end
