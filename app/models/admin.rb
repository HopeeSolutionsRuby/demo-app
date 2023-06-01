# frozen_string_literal: true

class Admin < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  before_save { self.email = email.downcase }
  before_save { self.phone = phone.to_s }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :phone, format: { with: /\A[0-9+]+\z/ }

  enum status: { active: 0, inactive: 1 }
  enum role: { admin: 0, user: 1 }
  mount_uploader :avatar, AvatarUploader
  serialize :avatars, JSON

  def active_for_authentication?
    super && active?
  end
end
