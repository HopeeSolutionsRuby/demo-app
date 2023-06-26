# frozen_string_literal: true

class Payment < ApplicationRecord
  has_many :bill_lines, dependent: :destroy, inverse_of: :payment
  has_many :bills, through: :bill_lines, inverse_of: :payments

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description id name updated_at]
  end
end
