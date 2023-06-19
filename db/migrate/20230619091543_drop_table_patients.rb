class DropTablePatients < ActiveRecord::Migration[7.0]
  def change
    drop_table :patients
  end
end
