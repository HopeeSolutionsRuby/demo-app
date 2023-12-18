# frozen_string_literal: true

FactoryBot.define do
  factory :clinic do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    region { Faker::Address.state }
    faculity do
      ['Surgery', 'Orthopedic surgery', 'Plastic surgery', 'Neurosurgery', 'Internal medicine', 'Andrology', 'Cardiology',
       'Hematology', 'Gynecology', 'Neurology'].sample
    end
  end
end
