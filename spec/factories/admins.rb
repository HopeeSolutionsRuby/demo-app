FactoryBot.define do
  factory :admin do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    status { [:active, :inactive].sample }
    role { [:admin, :customer_service].sample }
    password { Faker::Internet.password(min_length: 6, max_length: 20) }
  end
end
