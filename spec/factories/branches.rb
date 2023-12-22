# frozen_string_literal: true

FactoryBot.define do
  factory :branch do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    ward { Faker::Address.community }
    district { Faker::Address.city }
    city { Faker::Address.city }
    clinic_id { FactoryBot.create(:clinic).id }
  end
end
