# frozen_string_literal: true

class Student < ApplicationRecord
  include ActiveModel::Validations

  has_many :results
  validates_associated :results
  belongs_to :faculty

  scope :year, ->(year) { where(year: year) }
  scope :in_faculty, ->(faculty_name) {
    joins(:faculty).where(faculties: { name: faculty_name })
  }
  validates :name, presence: true, uniqueness: true, name: true
  validates :year, numericality: { in: 1..4 }

  before_validation :check_name

  def check_name
    return unless name == 'Tu dep trai'

    Rails.logger.debug 'Nah nah! This is a beautiful name'
    throw :abort
  end
end
