# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    email { Faker::Internet.email }
    status { ['active', 'inactive'].sample }
    role { ['admin', 'customer_service'].sample }
    password { Faker::Internet.password(min_length: 6, max_length: 128) }
  end
end
