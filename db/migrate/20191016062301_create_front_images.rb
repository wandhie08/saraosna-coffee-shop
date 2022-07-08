class CreateFrontImages < ActiveRecord::Migration[5.2]
  def change
    create_table :front_images do |t|
      t.string :image
      t.string :slug
      t.boolean :published, default: true
      t.string :name

      t.timestamps
    end
    add_index :front_images, :slug, unique: true
  end
end
