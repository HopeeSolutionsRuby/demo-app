# frozen_string_literal: true

# class Clinic < ApplicationRecord
class Clinic < ApplicationRecord
  # mount_uploaders :pictures, ClinicPicturesUploader
  # serialize :avatars, JSON

  def self.ransackable_attributes(_auth_object = nil)
    ["address", "created_at", "faculity", "id", "name", "region", "updated_at"]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
