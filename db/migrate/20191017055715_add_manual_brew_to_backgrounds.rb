class AddManualBrewToBackgrounds < ActiveRecord::Migration[5.2]
  def change
    add_column :backgrounds, :manual_brew, :string
  end
end
