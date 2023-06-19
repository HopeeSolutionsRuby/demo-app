class DropTableAddresses < ActiveRecord::Migration[7.0]
  def change
    drop_table :addresses
  end
end
