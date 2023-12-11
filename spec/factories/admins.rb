FactoryBot.define do
  factory :admin do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'pass12' }
  end
end
