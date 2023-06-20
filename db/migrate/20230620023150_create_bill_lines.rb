class CreateBillLines < ActiveRecord::Migration[7.0]
  def change
    create_table :bill_lines, id: false do |t|
      t.belongs_to :bill, null: false, foreign_key: true
      t.belongs_to :payment, null: false, foreign_key: true
      t.decimal :amount, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
