# frozen_string_literal: true

class Product < ApplicationRecord
  include ProductActivities

  belongs_to :category, touch: true, counter_cache: true

  has_many :order_lines, inverse_of: :product, dependent: :destroy
  has_many :orders, through: :order_lines, inverse_of: :products

  validates :name, :price, presence: true
  validates :price, numericality: true
end
