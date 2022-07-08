class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.integer :queue_number
      t.string :status
      t.references :serving_method, foreign_key: true
      t.references :serving_type, foreign_key: true
      t.references :coffee_bean, foreign_key: true

      t.timestamps
    end
  end
end
