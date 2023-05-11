# frozen_string_literal: true

class AddCourseIdToLab < ActiveRecord::Migration[7.0]
  def change
    add_column :labs, :course_id, :integer
  end
end
