# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  before_save :check_and_update_quantity
  has_one :payment, dependent: :destroy

  private

  def check_and_update_quantity
    existing_cart = Cart.find_by(product_id:, user_id:)
    if existing_cart
      existing_cart.quantity += 1
      existing_cart.save
      throw :abort
    end
  end
end
