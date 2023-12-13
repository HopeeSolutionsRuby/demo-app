# frozen_string_literal: true

# Admin
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  devise :timeoutable, timeout_in: 30.minutes

  # Custom validations
  validates :full_name, presence: {
    message: 'Please provide your full name'
  }
  validates :gender, presence: true, inclusion: {
    in: %w(male female other),
    message: 'must be male, female, or other'
  }
  validates :age, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    message: 'must be a none-negative integer'
  }
  validates :username, presence: true
  validates :password, format: {
    with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/,
    message: 'should contain at least one letter, one number, and be at least 6 characters long'
  }
  
  # Enum gender
  enum gender: { male: 0, female: 1, other: 2 }

  def self.authentication_keys
    [:username]
  end
end
