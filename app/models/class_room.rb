# frozen_string_literal: true

class ClassRoom < ApplicationRecord
  include GeneralCallbacks
  has_many :students, dependent: :destroy
  validates :name, :location, presence: true
  def self.ransackable_associations(auth_object = nil)
    ["students"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "name", "students_count", "updated_at"]
  end
end
