# frozen_string_literal: true

class Storage < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :labs, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :carts, dependent: :destroy
  validates :product_name, presence: true
  validates :product_name, uniqueness: true
  validates :product_quantity, numericality: { only_integer: true, greater_than: 0 }
end
