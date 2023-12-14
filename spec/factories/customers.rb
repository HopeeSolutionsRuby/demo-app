# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    age { Faker::Number.between(from: 0, to: 100) }
    gender { %w[male female other].sample }
    avatar { Faker::Avatar.image }
  end
end
