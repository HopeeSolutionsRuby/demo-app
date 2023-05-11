# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  before_validation :normalize_location, if: :location?

   private

  def normalize_location
    self.location = location.strip.titleize
  end
end
