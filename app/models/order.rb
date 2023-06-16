# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :admin

  has_many :order_lines, inverse_of: :order
  has_many :products, through: :order_lines

  validates :date, :total, presence: { strict: true }
  validates :total, numericality: true

  validates_associated :admin
end
