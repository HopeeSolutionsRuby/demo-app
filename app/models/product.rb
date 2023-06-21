# frozen_string_literal: true

class Product < ApplicationRecord
  include ProductActivities

  belongs_to :category, touch: true, counter_cache: true, inverse_of: :products

  has_many :order_lines, inverse_of: :product, dependent: :restrict_with_exception
  has_many :orders, through: :order_lines, inverse_of: :products
  has_many :images, as: :imageable, dependent: :restrict_with_exception, inverse_of: :imageable
  has_many :comments, as: :commentable, dependent: :restrict_with_exception, inverse_of: :commentable

  validates :name, :price, presence: true
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }
end
