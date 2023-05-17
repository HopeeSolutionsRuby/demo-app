# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :storage
  after_commit :increase_product_quantity
  # after_commit :destroy_new_cart, on: :create
  has_one :payment

  private

  def increase_product_quantity
    existing_cart = Cart.find_by(product_id: self.product_id, user_id: self.user_id)
    if existing_cart && existing_cart != self
      self.quantity += existing_cart.quantity
    end
    existing_cart.destroy
    self.save
  end

  # def destroy_new_cart
  #   self.cart.destroy if self.cart && self.cart.new_record?
  # end

end
