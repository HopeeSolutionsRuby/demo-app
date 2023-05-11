# frozen_string_literal: true

class Product < ApplicationRecord
  validate :blank
  has_many :carts, dependent: :destroys
  has_many :images, as: :imageable, dependent: :destroy

  private

  def blank
    errors.add(:price, 'price is blank') if price.to_s.empty? || discount_price.to_s.empty?
    errors.add(:description, 'description is blank') if description.empty?
  end
end
