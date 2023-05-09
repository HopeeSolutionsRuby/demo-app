# frozen_string_literal: true

class User < ApplicationRecord
  validate :blank
  before_validation :ensure_profile_exists
  validate :to_numeric?
  before_validation :normalize_phone_number
  before_save :check_password_changed
  after_create :send_welcome_email
  before_destroy :clear_cart
  has_many :articles, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :course, dependent: :destroy
  has_many :lab, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :teaching_assistants, dependent: :destroy
  has_one :professor, dependent: :destroy

  private

  def blank
    errors.add(:password, 'please insert your password') if password.empty?
  end

  def to_numeric?
    errors.add(:password, 'Your password contains only digits, please try again') if password.match?(/\A\d+\z/)
  end

  def normalize_phone_number
    self.phone_number = phone.gsub(/\D/, '')
  end

  def ensure_profile_exists
    build_profile if profile.blank?
  end

  def clear_cart
    cart_items.destroy_all
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def check_password_changed
    if password_changed?
      if self.encrypted_password == self.encrypted_password_was
        self.errors.add(:password, 'cannot be the same as the previous password')
        throw(:abort)
      end
    end
  end
end
