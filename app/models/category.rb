class Category < ApplicationRecord
	before_destroy :check_products
  has_many :products
  mount_uploader :images, AvatarUploader
  serialize :images, JSON

  private

  def check_products
    if products.exists?
      errors.add(:base, "Cannot delete category with associated products")
      throw(:abort)
    end
  end
end
