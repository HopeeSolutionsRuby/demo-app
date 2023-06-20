# frozen_string_literal: true

class OrderLine < ApplicationRecord
  belongs_to :order, inverse_of: :order_lines
  belongs_to :product, inverse_of: :order_lines

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  validates_associated :order
  validates_associated :product
end
