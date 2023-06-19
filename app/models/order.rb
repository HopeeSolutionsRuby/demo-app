# frozen_string_literal: true

class Order < ApplicationRecord
  include OrderActivities

  belongs_to :admin, counter_cache: true

  has_many :order_lines, dependent: :destroy, inverse_of: :order
  has_many :products, through: :order_lines, inverse_of: :orders

  validates :date, :total, presence: true
  validates :total, numericality: true
  validates :date, comparison: { less_than_or_equal_to: Date.current }

  validates_associated :admin
end
