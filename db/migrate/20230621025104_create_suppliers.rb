class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.integer :supplier_id

      t.timestamps
    end
  end
end
