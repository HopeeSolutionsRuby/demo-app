# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  before_save :check_include

  private

  def check_include(product_id)
    item = cart_items.find_by(product_id: product_id)
    if item
      item.quantity += 1
      item.save
    else
      cart_items.create(product_id: product_id, quantity: 1)
    end
  end
end
