# frozen_string_literal: true

class AddColumnsToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :dob, :date
    add_column :students, :contact_number, :string
    add_column :students, :address, :string
  end
end
