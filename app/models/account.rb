# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone, phone: true, uniqueness: true, unless: -> { phone.blank? }

  enum role: { employee: 0, employer: 1, admin: 2 }

  mount_uploader :avatar, AvatarUploader
end
