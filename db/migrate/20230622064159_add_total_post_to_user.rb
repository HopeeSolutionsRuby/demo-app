class AddTotalPostToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_count, :integer, defalut: 0
  end
end
