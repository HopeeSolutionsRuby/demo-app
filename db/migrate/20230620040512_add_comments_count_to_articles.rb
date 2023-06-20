class AddCommentsCountToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :comments_count, :integer
  end
end
