# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :phone, numericality: { only_integer: true, message: 'Please enter only numbers' }

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  enum sex: { male: 0, female: 1 }

  mount_uploader :avatar, AvatarUploader
  def self.ransackable_attributes(auth_object = nil)
    ["address", "age", "avatar", "created_at", "email", "encrypted_password", "full_name", "id", "id_value", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "sex", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
