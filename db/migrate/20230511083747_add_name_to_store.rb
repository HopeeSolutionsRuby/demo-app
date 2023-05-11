# frozen_string_literal: true

class AddNameToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :name, :string
  end
end
