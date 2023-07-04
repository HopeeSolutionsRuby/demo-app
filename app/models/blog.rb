# frozen_string_literal: true

# Class model for blog
class Blog < ApplicationRecord
  belongs_to :student, counter_cache: true

  validates :title, :content, :student_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id content title updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['student']
  end
end
