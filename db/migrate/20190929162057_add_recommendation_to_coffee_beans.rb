class AddRecommendationToCoffeeBeans < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_beans, :recommendation, :boolean, default: false
  end
end
