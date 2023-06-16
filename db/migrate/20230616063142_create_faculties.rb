class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :name, null: false 
      t.integer :year

      t.timestamps
    end
  end
end
