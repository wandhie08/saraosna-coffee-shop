class AddMobilePhoneToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :mobile_phone, :string
  end
end
