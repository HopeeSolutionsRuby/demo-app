# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :student_number
      t.string :description
      t.timestamps
    end
  end
end
