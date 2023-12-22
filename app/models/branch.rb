# frozen_string_literal: true

class Branch < ApplicationRecord
  before_validation :trim_input
  validates :name, :address, presence: true, uniqueness: true

  belongs_to :clinic

  def self.ransackable_attributes(_auth_object = nil)
    %w[address city clinic_id created_at district id id_value name updated_at ward]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[clinic]
  end

  private

  def trim_input
    self.name = name.strip if name.present?
    self.address = address.strip if address.present?
    self.ward = ward.strip if ward.present?
    self.district = district.strip if district.present?
    self.city = city.strip if city.present?
  end
end
