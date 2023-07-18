# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email(domain: 'gmail.com') }
    phone { Faker::PhoneNumber.unique.cell_phone_in_e164 }
    password { 1_234_561 }
    avatar { Faker::Movies::Avatar.character }
  end

  factory :employee, parent: :account do
    role { 0 }
  end

  factory :employer, parent: :account do
    role { 1 }
  end

  factory :admin, parent: :account do
    role { 2 }
  end
end
