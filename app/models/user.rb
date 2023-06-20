# frozen_string_literal: true

class User < ApplicationRecord
  include UserActivities::Register

  validates :first_name, :last_name, :email, presence: true
  validates :phone, :email, uniqueness: { case_sensitive: false }
  validates :phone, phone: true
  validates :email, email: true

  has_many :orders, dependent: :restrict_with_exception, inverse_of: :user
  has_many :images, as: :imageable, dependent: :restrict_with_exception, inverse_of: :imageable
  has_many :comments, as: :owner, dependent: :restrict_with_exception, inverse_of: :owner

  enum status: { active: 0, inactive: 1 }
  enum role: { admin: 0, customer_service: 1 }
end
