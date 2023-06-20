# frozen_string_literal: true

# Class model for Studen project
class StudentProject < ApplicationRecord
  belongs_to :student
  belongs_to :project
end
