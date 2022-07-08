class AddVisibleToServingMethods < ActiveRecord::Migration[5.2]
  def change
    add_column :serving_methods, :visible, :boolean, default: true
  end
end
