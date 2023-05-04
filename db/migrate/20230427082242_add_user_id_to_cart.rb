# frozen_string_literal: true

# active record
class AddUserIdToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :user_id, :int
  end
end
