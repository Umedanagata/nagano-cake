class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :orders_id
      t.integer :items_id
      t.string :name
      t.integer :price
      t.integer :quantity
      t.integer :production_status, null:false, default: 0

      t.timestamps
    end
  end
end
