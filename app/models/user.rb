# frozen_string_literal: true
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
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
    find_by!(reset_password_token: reset_token)
  end

  def create_reset_digest
    self.reset_token = generate_reset_token
    self.reset_password_token = User.digest(reset_token)
    update_columns(reset_password_token: reset_password_token)
  end

  private

  def generate_reset_token
    SecureRandom.urlsafe_base64
  end

end
