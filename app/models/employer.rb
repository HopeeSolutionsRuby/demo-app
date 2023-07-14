# frozen_string_literal: true

class Employer < ApplicationRecord
  belongs_to :account

  validates :name, presence: true, length: { in: 4..80 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :company_size, numericality: { only_integer: true, greater_than: 0 }
end
