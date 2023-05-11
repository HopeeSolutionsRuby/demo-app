# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :descriptions
      t.string :release_year
      t.string :language
      t.integer :rate
      t.string :length
      t.string :actor
      t.string :category
      t.integer :course_id
      t.integer :lab_id
      t.timestamps
    end
  end
end
