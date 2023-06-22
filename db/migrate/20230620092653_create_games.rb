# frozen_string_literal: true

# E
class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :dev

      t.timestamps
    end
  end
end
