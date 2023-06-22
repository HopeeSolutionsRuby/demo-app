# frozen_string_literal: true

# E
class AddBlogsCountToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :blogs_count, :integer, default: 0, null: false

    Student.find_each do |student|
      Student.reset_counters(student.id, :blogs)
    end
  end
end
