class AddColorToServingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :serving_types, :color, :string
  end
end
