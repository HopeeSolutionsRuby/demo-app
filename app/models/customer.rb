# frozen_string_literal: true

# Customer
class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  mount_uploader :avatar, AvatarUploader

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

  # Enum gender
  enum gender: { male: 0, female: 1, other: 2 }
end
