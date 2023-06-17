# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :destroy, inverse_of: :category

  validates :name, presence: true
  validates_associated :products

  after_touch :touch_product_or_category

  private

  def touch_product_or_category
    Rails.logger.debug 'after_touch Category/Product'
  end
end
