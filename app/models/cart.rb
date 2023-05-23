# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :storage
  has_one :payment

  def add_product(product_id)
    current_item = Product.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = Product.build(product_id: product_id)
    end
    current_item
  end
end
