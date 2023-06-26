# frozen_string_literal: true

class Student < ApplicationRecord
  include StudentCallback
  enum status: { active: 0, deactive: 1 }

  has_many :results, dependent: :destroy
  belongs_to :faculty, counter_cache: true, autosave: true

  scope :year, ->(year) { where(year: year) }
  scope :y9_active, -> { joins(:faculty).merge(Faculty.year09).active }

  validates :name, presence: true, uniqueness: true, name: true
  validates :year, numericality: { in: 1..4 }
end
