# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :storage
  validates :url, format: { with: /\.(png|jpg|jpeg)\z/i, message: "must be a URL for PNG, JPG or JPEG image." }
  before_save :update_file_size

  private

  def update_file_size
    file_size = image_file_size
  end
end
