# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :payments
  belongs_to :storage
  # has_many :products, through: :payments
  belongs_to  :product

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

  def quantity_change(request)
    product_id = request.GET['prod_id']
    if Cart.exists?(product: product_id)
      c = Cart.find_by(product: product_id, user: request.user)
      user = request.user
      cart = Cart.where(user: user)
      amount = 0
      cart.each do |p|
        if p.product.discounted_price != 0
          value = p.quantity * p.product.discounted_price
          amount += value
        else
          value = p.quantity * p.product.selling_price
          amount += value
        end
      end
      totalamount = amount + 40
      data = {
        quantity: c.quantity,
        amount: amount,
        totalamount: totalamount
      }
      JsonResponse.new(data)
    end
  end
end
