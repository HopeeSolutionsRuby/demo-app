class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.datetime :birthday
      t.string :address

      t.timestamps
    end
  end
end
