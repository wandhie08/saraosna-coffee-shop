class AddIsRecemmendationToServingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :serving_types, :is_recommendation, :boolean, default: false
  end
end
