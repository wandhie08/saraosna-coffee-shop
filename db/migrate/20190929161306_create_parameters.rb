class CreateParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :parameters do |t|
      t.string :name
      t.string :alias
      t.string :description
      t.string :value
      t.string :values
      t.string :slug

      t.timestamps
    end
    add_index :parameters, :alias, unique: true
    add_index :parameters, :slug, unique: true
  end
end
