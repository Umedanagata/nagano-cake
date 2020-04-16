class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customers_id
      t.string :postcode
      t.string :address
      t.string :ship_name

      t.timestamps
    end
  end
end
