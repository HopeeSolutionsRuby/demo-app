# frozen_string_literal: true

class Result < ApplicationRecord
  include SaveCallback

  belongs_to :student, counter_cache: :results_count
  belongs_to :term

  validates :point, numericality: { in: 0..10 }

  scope :passing, -> { where('point > ?', 5) }
  scope :top, ->(limit) { order(point: :desc).limit(limit) }
  scope :point_range, ->(min, max) { where(point: min..max) }
  scope :by_student, ->(student_id) { where(student_id: student_id) }
end
