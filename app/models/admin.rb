# frozen_string_literal: true

class Admin < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.phone = phone.to_s }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates :phone, :email, uniqueness: true
  validates_with NameVyValidator
  validates :phone, phone: true
  validates :email, email: true

  enum status: { active: 0, inactive: 1 }
  enum role: { admin: 0, customer_service: 1 }

  has_many :orders, dependent: :destroy, inverse_of: :admin

  def active_for_authentication?
    super && active?
  end
end
