class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.decimal :total

      t.references :admin, null:false, foreign_key: true
      t.timestamps
    end
  end
end
