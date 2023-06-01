class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :discount_price, null: false
      t.string :description, null: false
      t.integer :category_id, null: false
      t.string :images
      t.timestamps
    end
  end
end
