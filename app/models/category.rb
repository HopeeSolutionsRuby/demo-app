# frozen_string_literal: true

class Category < ApplicationRecord
  include CategoryActivities

  has_many :products, dependent: :restrict_with_exception, inverse_of: :category

  validates :name, presence: true
  # uniqueness: { case_sensitive: false },
  # format: { with: /\A[A-Za-z0-9_\-]+\z/ }

  validates_associated :products

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description id name products_count updated_at]
  end
end
