class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :date_of_birth, default: ''
      t.string :address, default: ''
      t.string :sex, default: ''
      t.timestamps
    end
  end
end
