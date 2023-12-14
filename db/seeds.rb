# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Clear existing records
Customer.destroy_all

# Create 50 customers
50.times do
  Customer.create!(
    email: Faker::Internet.email,
    encrypted_password: Devise.friendly_token,
    full_name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    age: Faker::Number.between(from: 1, to: 80),
    address: Faker::Address.full_address,
    sex: Faker::Number.between(from: 0, to: 1),
    reset_password_token: nil, # You may adjust this based on your requirements
    reset_password_sent_at: nil,
    remember_created_at: nil,
    created_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
    avatar: nil # You may adjust this based on your requirements
  )
end
