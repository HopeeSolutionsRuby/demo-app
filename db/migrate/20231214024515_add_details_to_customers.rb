# frozen_string_literal: true

class AddDetailsToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :full_name, :string
    add_column :customers, :age, :integer
    add_column :customers, :gender, :integer, default: 0
  end
end
