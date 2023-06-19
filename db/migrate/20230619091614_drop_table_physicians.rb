class DropTablePhysicians < ActiveRecord::Migration[7.0]
  def change
    drop_table :physicians
  end
end
