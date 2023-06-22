# frozen_string_literal: true

# E
class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins, &:timestamps
  end
end
