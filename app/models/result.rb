# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :student, counter_cache: true
  belongs_to :term

  validates :point, numericality: { in: 0..10 }

  scope :passing, -> { where('point > ?', 5) }
  scope :top, ->(limit) { order(point: :desc).limit(limit) }
  scope :point_range, ->(min, max) { where(point: min..max) }
  scope :by_student, ->(student_id) { where(student_id: student_id) }
  scope :y9pass, -> { joins(:student).merge(Student.y9_active).passing }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id point student_id term_id updated_at]
  end
end
