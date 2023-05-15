class CreateStorages < ActiveRecord::Migration[7.0]
  def change
    create_table :storages do |t|
      t.integer :product_id
      t.integer :course_id
      t.integer :lab_id
      t.string :product_name
      t.integer :product_quantity
      t.timestamps
    end
  end
end
