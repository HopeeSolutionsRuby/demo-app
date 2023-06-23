# frozen_string_literal: true

class Faculty < ApplicationRecord
  include FacultyCallback

  has_many :students, dependent: :restrict_with_exception
  has_many :subjects, dependent: :restrict_with_exception

  validates :name, presence: true

  scope :year09, -> { where(year: 2009) }
end
