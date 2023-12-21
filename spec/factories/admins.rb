# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'admin123' }
    password_confirmation { password }
  end
end
