# frozen_string_literal: true

class Order < ApplicationRecord
  include OrderActivities::CallBacks

  belongs_to :user, counter_cache: true, inverse_of: :orders

  has_one :bill, dependent: :restrict_with_exception, inverse_of: :order

  has_many :order_lines, dependent: :restrict_with_exception, inverse_of: :order
  has_many :products, through: :order_lines, inverse_of: :orders

  has_many :payment_lines, dependent: :restrict_with_exception, inverse_of: :order
  has_many :payments, through: :payment_lines, inverse_of: :orders

  validates :date, :total, presence: true
  validates :total, numericality: { greater_than: 0 }
  validates :date, comparison: { less_than_or_equal_to: Date.current }

  validates_associated :user

  enum status: { pending: 0, confirmed: 1, shipped: 2, delivered: 3 }
end
