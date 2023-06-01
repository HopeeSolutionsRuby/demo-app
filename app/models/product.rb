class Product < ApplicationRecord
	mount_uploaders :images, AvatarUploader
  serialize :images, JSON
  belongs_to :category
end
