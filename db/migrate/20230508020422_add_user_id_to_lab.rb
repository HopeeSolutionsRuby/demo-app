# frozen_string_literal: true

class AddUserIdToLab < ActiveRecord::Migration[7.0]
  def change
    add_column :labs, :user_id, :integer
  end
end
