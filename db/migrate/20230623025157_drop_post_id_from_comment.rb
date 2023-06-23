class DropPostIdFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :post_id, :bigint
  end
end
