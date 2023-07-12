# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, default: ''
      t.integer :gender, default: 0, null: false
      t.string :address, default: ''

      t.belongs_to :account, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
