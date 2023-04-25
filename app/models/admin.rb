# frozen_string_literal: true

class Admin < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.phone = phone.to_s }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true
  validates :phone, length: { is: 10 }
  validates :phone, format: { with: /\A[0-9]+\z/ }

  enum status: { active: 0, inactive: 1 }
  enum role: { admin: 0, customer_service: 1 }
end
