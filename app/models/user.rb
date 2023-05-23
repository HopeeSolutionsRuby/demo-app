# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  validate :blank
  # before_validation :ensure_profile_exists
  validate :to_numeric?
  # before_validation :normalize_phone_number
  # before_save :check_password_changed
  # after_create :send_welcome_email
  before_destroy :clear_cart
  has_many :articles, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :course, dependent: :destroy
  has_many :lab, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  # has_one :profile, dependent: :destroy
  has_one :teaching_assistants, dependent: :destroy
  has_one :professor, dependent: :destroy
  has_secure_password
  validates :password, presence: true

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def self.find_by_password_reset_token!(reset_token)
    find_by!(reset_digest: reset_token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token))
    # update_attribute(:reset_sent_at, Time.zone.now)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # def password_reset_expired?
  #   reset_sent_at < 2.hours.ago
  # end

  private

  def blank
    errors.add(:password, 'please insert your password') if password.blank?
  end

  def to_numeric?
    errors.add(:password, 'Your password contains only digits, please try again') unless password&.match?(/\A\d+\z/)
  end

  # def normalize_phone_number
  #   self.phone_number = phone.gsub(/\D/, '')
  # end

  # def ensure_profile_exists
  #   build_profile if profile.blank?
  # end

  def clear_cart
    cart_items.destroy_all
  end

  # def send_welcome_email
  #   UserMailer.welcome_email(self).deliver_now
  # end

  # def check_password_changed
  #   if password_changed?
  #     if encrypted_password == encrypted_password_was
  #       errors.add(:password, 'cannot be the same as the previous password')
  #       throw(:abort)
  #     end
  #   end
  # end
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
