class AddOrdersCountToServingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :serving_types, :orders_count, :integer, null: false, default: 0
  end
end
