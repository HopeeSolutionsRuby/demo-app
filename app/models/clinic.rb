# frozen_string_literal: true

# class Clinic < ApplicationRecord
class Clinic < ApplicationRecord
  mount_uploaders :pictures, ClinicPicturesUploader
  validates :pictures, file_size: { in: 1.kilobytes..1.gigabyte }
  CSV_ATTRIBUTES = %w(name address region faculity pictures).freeze
  def self.ransackable_attributes(_auth_object = nil)
    %w[address created_at faculity id name region updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
