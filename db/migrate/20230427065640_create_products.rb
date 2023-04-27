class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :price
      t.integer :discount_price
      t.string :description
      t.timestamps
    end
  end
end
