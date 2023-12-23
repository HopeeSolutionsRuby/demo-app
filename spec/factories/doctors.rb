# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    full_name { Faker::Name.name }
    address { Faker::Address.full_address }
    age { Faker::Number.between(from: 25, to: 65) }
    email { Faker::Internet.email }
    gender { %i[male female other].sample }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end
