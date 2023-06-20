# frozen_string_literal: true

class Category < ApplicationRecord
  include CategoryActivities

  has_many :products, dependent: :destroy, inverse_of: :category

  validates :name, presence: true
  # uniqueness: { case_sensitive: false },
  # format: { with: /\A[A-Za-z0-9_\-]+\z/ }

  validates_associated :products
end
