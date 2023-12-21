# frozen_string_literal: true

# Admin
class Admin < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
    end
  end
end
