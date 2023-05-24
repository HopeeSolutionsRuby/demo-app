# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :payments
  belongs_to :storages
  has_many :products, through: :payments

  def total
    payments.to_a.sum {|payments| payments.total}
  end

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
