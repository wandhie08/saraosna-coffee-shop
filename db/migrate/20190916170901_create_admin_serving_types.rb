class CreateAdminServingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :serving_types do |t|
      t.string :name
      t.string :image
      t.string :slug
      t.references :serving_method, foreign_key: true
      t.text :description
      t.string :bean
      t.string :result

      t.timestamps
    end
    add_index :serving_types, :slug, unique: true
  end
end
