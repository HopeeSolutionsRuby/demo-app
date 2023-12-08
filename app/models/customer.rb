class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
end
# frozen_string_literal: true

class Customer < ApplicationRecord
  validates :phone, numericality: { only_integer: true, message: 'Please enter only numbers' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { male: 0, female: 1 }

  mount_uploader :avatar, AvatarUploader
end
