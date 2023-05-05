# frozen_string_literal: true

class CreateLabs < ActiveRecord::Migration[7.0]
  def change
    create_table :labs do |t|
      t.string :name
      t.string :subject
      t.string :description
      t.timestamps
    end
  end
end
