# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :order, inverse_of: :bill

  has_many :bill_lines, dependent: :destroy, inverse_of: :bill
  has_many :payments, through: :bill_lines, inverse_of: :bills

  delegate :payments, to: :printer

  validates :date, comparison: { less_than_or_equal_to: Date.current }

  enum status: { pending: 0, processing: 1, finished: 2 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at date id order_id status updated_at]
  end

  def printer
    @printer ||= BillPrinter.new(self)
  end
end
