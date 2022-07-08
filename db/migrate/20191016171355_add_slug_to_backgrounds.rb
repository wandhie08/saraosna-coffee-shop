class AddSlugToBackgrounds < ActiveRecord::Migration[5.2]
  def change
    add_column :backgrounds, :slug, :string
    add_index :backgrounds, :slug, unique: true
  end
end
