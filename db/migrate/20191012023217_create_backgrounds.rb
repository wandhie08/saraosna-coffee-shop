class CreateBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :backgrounds do |t|
      t.string :color
      t.string :image

      t.timestamps
    end
  end
end
