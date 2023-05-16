# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :storage
  before_save :increase_product_quantity
  has_one :payment

  private

  def increase_product_quantity
    cart = Cart.find_by(product_id:, user_id:)
    if cart
      cart.quantity += 1
    else
      self.cart.create(:user_id => user.id, :product_id => product.id, :quantity => 1)
    end
  end
end
