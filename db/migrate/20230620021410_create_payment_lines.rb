class CreatePaymentLines < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_lines, id:false do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :payment, null: false, foreign_key: true
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
