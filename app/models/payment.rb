# frozen_string_literal: true
require "cart"
require "storage"

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :product
  after_save :delete_cart
  # after_commit :send_inform_email, on: :create
  after_commit :decrease_product_quantity
  after_commit :check_product_quantity, on: [:create]

  def total
    if product.discounted_price == 0
      product.price * quantity
    else
      product.discounted_price * quantity
    end 
  end
  
  private

  def delete_cart
    cart = Cart.find_by(id: cart_id, user_id:)
    cart.destroy if cart.present?
  end

  def decrease_product_quantity
    product = Product.find_by(id: cart.product_id)
    return if product.blank?

    storage = product.storage
    return if storage.blank?

    perform_decrease = false

    Payment.transaction do
      begin
        storage.with_lock do
          storage.update!(product_quantity: storage.product_quantity - cart.quantity)
          perform_decrease = true
        end
      rescue => e
        raise ActiveRecord::Rollback
        puts "Có ngoại lệ xảy ra: #{e.message}"
      end
    end
  end

  def check_product_quantity
    product = Product.find_by(id: cart.product_id)
    storage = product.storage if product.present?
    Payment.transaction do
      raise ActiveRecord::Rollback if product.nil? || (storage.present? && storage.product_quantity < cart.quantity)
    end
  end

  # def after_rollback
  #   send an email to the administrator
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
