class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :postcode
      t.string :ship_name
      t.integer :postage, default: 800
      t.integer :amount
      t.integer :payment_method, null:false
      t.integer :orders_status, null: false, default: 0

      t.timestamps
    end
  end
end
