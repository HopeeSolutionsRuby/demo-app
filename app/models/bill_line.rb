# frozen_string_literal: true

class BillLine < ApplicationRecord
  belongs_to :bill, inverse_of: :bill_lines
  belongs_to :payment, inverse_of: :bill_lines

  validates :amount, presence: true, numericality: { greater_than: 0 }

  validates_associated :bill
  validates_associated :payment
end
