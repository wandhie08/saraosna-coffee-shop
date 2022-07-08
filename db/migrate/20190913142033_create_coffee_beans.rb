class CreateCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_beans do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :coffee_beans, :slug, unique: true
  end
end
