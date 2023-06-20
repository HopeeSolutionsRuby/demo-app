# frozen_string_literal: true

class Payment < ApplicationRecord
  has_many :bill_lines, dependent: :destroy, inverse_of: :payment
  has_many :bills, through: :bill_lines, inverse_of: :payments
end
