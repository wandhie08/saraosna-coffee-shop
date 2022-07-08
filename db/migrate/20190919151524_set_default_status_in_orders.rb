class SetDefaultStatusInOrders < ActiveRecord::Migration[5.2]
   def self.up
    change_column :orders, :status, :integer, default: 0
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
