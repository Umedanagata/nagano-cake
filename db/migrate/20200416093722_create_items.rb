class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.text :text
      t.integer :price
      t.boolean :is_sale

      t.timestamps
    end
  end
end
