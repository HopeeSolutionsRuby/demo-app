# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { in: 5..70 }
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w.-]+@[a-zA-Z]+\.[a-zA-Z]{2,}\z/, message: 'is invalid' }
  has_secure_password

  has_many :posts, dependent: :restrict_with_exception
end
