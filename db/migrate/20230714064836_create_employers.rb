# frozen_string_literal: true

class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false
      t.integer :company_size, default: 1
      t.string :website, default: ''
      t.text :description

      t.timestamps
    end
  end
end
