class CreateOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lines, id: false do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
