class AddFieldsToBackgrounds < ActiveRecord::Migration[5.2]
  def change
    add_column :backgrounds, :serving_method, :string
    add_column :backgrounds, :coffee_bean, :string
    add_column :backgrounds, :review_order, :string
  end
end
