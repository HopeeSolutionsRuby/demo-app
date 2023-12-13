# frozen_string_literal: true

# Class AvatarUploader
class ClinicPicturesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [200, 200]
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
