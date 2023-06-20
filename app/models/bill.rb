# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :order, inverse_of: :bill

  has_many :bill_lines, dependent: :destroy, inverse_of: :bill
  has_many :payments, through: :bill_lines, inverse_of: :bills

  validates :date, comparison: { less_than_or_equal_to: Date.current }
end
