# frozen_string_literal: true

class CreateProfessors < ActiveRecord::Migration[7.0]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :major
      t.timestamps
    end
  end
end
