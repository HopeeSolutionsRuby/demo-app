# frozen_string_literal: true

class Student < ApplicationRecord
  include StudentCallback

  has_many :results, dependent: :restrict_with_exception
  validates_associated :results
  belongs_to :faculty, counter_cache: true

  scope :year, ->(year) { where(year: year) }
  scope :in_faculty, lambda { |faculty_name|
    joins(:faculty).where(faculties: { name: faculty_name })
  }

  validates :name, presence: true, uniqueness: true, name: true
  validates :year, numericality: { in: 1..4 }
end
