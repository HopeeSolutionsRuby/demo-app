# frozen_string_literal: true

class AddUserIdToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :user_id, :integer
  end
end
