# frozen_string_literal: true

class Category < ApplicationRecord
  include CategoryActivities

  has_many :products, dependent: :destroy, inverse_of: :category

  validates :name, presence: true
  validates :name, length: {maximun: 50}

  validates_associated :products
end
