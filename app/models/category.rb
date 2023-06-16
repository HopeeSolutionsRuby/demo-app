# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :destroy, inverse_of: :category

  validates :name, presence: true
  validates_associated :products
end
