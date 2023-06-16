# frozen_string_literal: true

class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_associated :order
  validates_associated :product
end
