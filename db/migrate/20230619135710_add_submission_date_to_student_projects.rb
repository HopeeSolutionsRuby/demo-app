# frozen_string_literal: true

class AddSubmissionDateToStudentProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :student_projects, :submission_date, :date
  end
end
