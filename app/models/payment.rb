# frozen_string_literal: true
require "cart"

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  after_save :delete_cart
  # after_commit :send_inform_email, on: :create
  after_commit :check_product_quantity, on: [:create]

  private

  def delete_cart
    cart = Cart.find_by(id: cart_id, user_id: user_id)
    cart.destroy if cart.present?
  end

  def check_product_quantity
    product = Product.find_by(id: cart.product_id)
    raise ActiveRecord::Rollback if product.nil? || product.quantity < cart.quantity
  end



  # def after_rollback
  #   # send an email to the administrator
  #   AdminMailer.order_error(self).deliver_later
  # end

  # def send_inform_email
  #   PaymentMailer.payment_confirmation(self).deliver_now
  # end
end

# class PaymentMailer < ApplicationMailer
#   def order_confirmation(payment)
#     @payment = payment
#     mail(to: cart.user_id.email, subject: 'Order confirm')
#   end
# end
