# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  has_many :carts
  has_many :payments
  has_one :profile
  validate :blank
  validate :is_to_numeric
  before_validation :normalize_phone_number
  before_destroy :clear_cart
  before_validation :ensure_profile_exists
  after_create :send_welcome_email
  before_save :check_password_changed
  private

  def blank
    errors.add(:password, 'please insert your password') if password.empty?
  end

  def is_to_numeric
    errors.add(:password, 'Your password contains only digits, please try again') if password.match?(/\A\d+\z/)
  end

  def normalize_phone_number
    self.phone_number = phone.gsub(/\D/, '')
  end

  def ensure_profile_exists
    build_profile unless profile.present?
  end

  def clear_cart
  	cart_items.destroy_all
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def check_password_changed
    if self.password_changed?
      if self.encrypted_password == self.encrypted_password_was
        self.errors.add(:password, 'cannot be the same as the previous password')
        throw(:abort)
      end
    end
  end
end
