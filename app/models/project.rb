# frozen_string_literal: true

# Class model for project
class Project < ApplicationRecord
  has_many :student_projects
  has_many :students, through: :student_projects
end
