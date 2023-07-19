# frozen_string_literal: true

class Employer < ApplicationRecord
  belongs_to :account

  validates :name, presence: true, length: { in: 4..80 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :company_size, numericality: { only_integer: true, greater_than: 1 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[account_id address company_size created_at description id name updated_at website]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['account']
  end
end
