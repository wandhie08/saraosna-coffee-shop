class AddNotesToServingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :serving_types, :notes, :string
    add_column :serving_methods, :notes, :string
  end
end
