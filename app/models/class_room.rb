# frozen_string_literal: true

class ClassRoom < ApplicationRecord
  include GeneralCallbacks
  has_many :students, dependent: :destroy
  accepts_nested_attributes_for :students
  validates :name, :location, presence: true
  def self.ransackable_associations(_auth_object = nil)
    ['students']
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id location name students_count updated_at]
  end
end
