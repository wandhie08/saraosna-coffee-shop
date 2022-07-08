class RenameRecommendationInCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    rename_column :coffee_beans, :recommendation, :is_recommendation
  end
end
