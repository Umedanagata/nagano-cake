class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customers_id
      t.string :address
      t.string :postcode
      t.string :ship_name
      t.integer :postage
      t.integer :amount
      t.integer :payment_method
      t.integer :orders_status

      t.timestamps
    end
  end
end
