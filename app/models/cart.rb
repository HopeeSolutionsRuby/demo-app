# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  before_save :check_include
  has_one :payment, dependent: :destroys

  private

  def check_include
    item = Cart.find_by(product_id:)
    if item
      item.quantity += 1
      item.save
    else
      cart_items.create(product_id:, quantity:)
    end
  end
end
