# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :phone, numericality: { only_integer: true, message: 'Please enter only numbers' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { male: 0, female: 1 }

  mount_uploader :avatar, AvatarUploader
end
