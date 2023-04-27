class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.boolean :Paid, default: false
      t.timestamps
    end
  end
end
