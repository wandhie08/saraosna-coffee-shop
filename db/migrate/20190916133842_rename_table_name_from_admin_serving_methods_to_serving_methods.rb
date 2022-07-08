class RenameTableNameFromAdminServingMethodsToServingMethods < ActiveRecord::Migration[5.2]
  def change
    rename_table :admin_serving_methods, :serving_methods
  end
end
