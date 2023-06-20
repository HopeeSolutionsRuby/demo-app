# frozen_string_literal: true

class PaymentLine < ApplicationRecord
  belongs_to :order, inverse_of: :payment_lines
  belongs_to :payment, inverse_of: :payment_lines

  validates_associated :order
  validates_associated :payment
end
