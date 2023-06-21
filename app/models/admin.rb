# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates :phone, :email, uniqueness: true
  validates :phone, phone: true
  validates :email, email: true

  enum status: { active: 0, inactive: 1 }
  enum role: { admin: 0, customer_service: 1 }

  has_many :images, as: :imageable, dependent: :restrict_with_exception, inverse_of: :imageable
  has_many :blogs, dependent: :restrict_with_exception, inverse_of: :admin
end
