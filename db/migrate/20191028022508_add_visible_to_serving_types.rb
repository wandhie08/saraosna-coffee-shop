class AddVisibleToServingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :serving_types, :visible, :boolean, default: true
  end
end
