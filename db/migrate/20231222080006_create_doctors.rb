class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :full_name, null: false
      t.integer :age, default: 0, null: false
      t.string :address, null: false
      t.string :phone_number, limit: 15, null: false
      t.integer :gender, default: 0, null: false
      t.string :email, null: false
      t.timestamps
    end
  end
end
