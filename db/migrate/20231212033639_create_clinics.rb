class CreateClinics < ActiveRecord::Migration[7.1]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :address
      t.string :region
      t.string :faculity

      t.timestamps
    end
  end
end
