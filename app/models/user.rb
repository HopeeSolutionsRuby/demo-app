# frozen_string_literal: true

class User < ApplicationRecord
  include UserActivities::Register

  validates :first_name, :last_name, :email, presence: true
  validates :phone, :email, uniqueness: { case_sensitive: false }
  validates :phone, phone: true
  validates :email, email: true

  has_many :orders, inverse_of: :user, dependent: :restrict_with_exception
  has_many :images, as: :imageable, inverse_of: :imageable, dependent: :restrict_with_exception
  has_many :comments, as: :owner, inverse_of: :owner, dependent: :restrict_with_exception

  enum status: { active: 0, inactive: 1 }
  enum role: { admin: 0, customer_service: 1 }

  has_one :vip_user, inverse_of: :user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "first_name", "id", "last_name", "orders_count", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "status", "updated_at"]
  end
end
