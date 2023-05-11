# frozen_string_literal: true

class RenameStudentNumberToUserIdInCourse < ActiveRecord::Migration[7.0]
  def change
    rename_column :courses, :student_number, :user_id
  end
end
