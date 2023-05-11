# frozen_string_literal: true
require "cart"

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  # after_save :delete_cart
  # after_commit :send_inform_email, on: :create
  after_commit :check_product_quantity, on: [:create]

  private

  # def delete_cart
  #   cart.destroy
  # end

  def check_product_quantity
    cart.product.each do |item|
      raise ActiveRecord::Rollback if cart.product.quantity < cart.quantity
    end
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
