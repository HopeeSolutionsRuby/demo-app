class AddStorageIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :storage_id, :integer
  end
end
