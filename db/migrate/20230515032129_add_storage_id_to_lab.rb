class AddStorageIdToLab < ActiveRecord::Migration[7.0]
  def change
    add_column :labs, :storage_id, :integer
  end
end
