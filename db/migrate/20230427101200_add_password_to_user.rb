# frozen_string_literal: true

# active record
class AddPasswordToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password, :string
  end
end
