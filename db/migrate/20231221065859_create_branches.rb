class CreateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :ward
      t.string :district
      t.string :city
      t.integer :clinic_id
      t.timestamps
    end
  end
end
