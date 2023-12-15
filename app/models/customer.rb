# frozen_string_literal: true

# Customer
class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  mount_uploader :avatar, AvatarUploader

  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables

  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, inclusion: { in: %w(male female other) }
  validates :full_name, length: { maximum: 255 }
  # Enum gender
  enum gender: { male: 0, female: 1, other: 2 }

  def self.not_send_email
    def send_devise_notification(notification, *args); end
  end
end
