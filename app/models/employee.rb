# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :account, inverse_of: :employee, dependent: :destroy

  accepts_nested_attributes_for :account, update_only: true

  validates :first_name, :last_name, :address, presence: true
  enum gender: { male: 0, female: 1, another: 2 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[account_id address created_at first_name gender id last_name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['account']
  end
end
