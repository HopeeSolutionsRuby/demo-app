# frozen_string_literal: true

# active record
class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :int
  end
end
