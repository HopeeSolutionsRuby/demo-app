class AddStorageIdToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :storage_id, :integer
  end
end
