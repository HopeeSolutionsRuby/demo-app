# frozen_string_literal: true

class Product < ApplicationRecord
  validate :blank
  has_many :carts, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  belongs_to :storage

  private

  def blank
    errors.add(:price, 'price is blank') if price.to_s.blank? || discount_price.to_s.empty?
    errors.add(:description, 'description is blank') if description.blank?
  end

end
