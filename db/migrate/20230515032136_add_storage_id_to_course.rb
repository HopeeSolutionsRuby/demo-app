class AddStorageIdToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :storage_id, :integer
  end
end
