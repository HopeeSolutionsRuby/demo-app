# frozen_string_literal: true

# Customer
class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  mount_uploader :avatar, AvatarUploader

  # Enum gender
  enum gender: { male: 0, female: 1, other: 2 }

  def self.not_send
    def send_devise_notification(notification, *args); end
  end
end
