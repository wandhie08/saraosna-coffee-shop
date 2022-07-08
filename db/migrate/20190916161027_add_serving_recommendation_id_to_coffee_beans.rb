class AddServingRecommendationIdToCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_beans, :serving_recommendation_id, :integer
  end
end
