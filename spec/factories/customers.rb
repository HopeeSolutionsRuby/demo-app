# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    age { Faker::Number.between(from: 1, to: 100) }
    gender { %w[male female other].sample }
    avatar { Faker::Avatar.image }
    created_at { Faker::Date.between(from: 11.months.ago, to: Date.today) }
  end
end
