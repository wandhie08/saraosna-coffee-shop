class AddEspressoBasedToBackgrounds < ActiveRecord::Migration[5.2]
  def change
    add_column :backgrounds, :espresso_based, :string
  end
end
