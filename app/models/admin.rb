# frozen_string_literal: true

# Admin
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Custom validations
  validates :username, presence: true
  validates :password, format: {
    with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/,
    message: 'should contain at least one letter, one number, and be at least 6 characters long'
  }

  def self.authentication_keys
    [:username]
  end
end
