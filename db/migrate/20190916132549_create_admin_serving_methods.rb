class CreateAdminServingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_serving_methods do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :slug

      t.timestamps
    end
    add_index :admin_serving_methods, :slug, unique: true
  end
end
