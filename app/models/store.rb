# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  before_save :normalize_address

   private

  def normalize_address
    self.address = address.strip.titleize
  end
end
