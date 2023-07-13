# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # version :medium_thumb do
  #   process resize_to_fill: [250, 250]
  #   def full_filename(_for_file)
  #     "avatar_medium.#{file.extension}"
  #   end
  # end

  # version :small_thumb do
  #   process resize_to_fill: [50, 50]
  #   def full_filename(_for_file)
  #     "avatar_small.#{file.extension}"
  #   end
  # end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
