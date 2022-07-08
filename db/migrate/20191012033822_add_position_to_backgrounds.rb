class AddPositionToBackgrounds < ActiveRecord::Migration[5.2]
  def change
    add_column :backgrounds, :position, :string
    add_index :backgrounds, :position, unique: true
  end
end
