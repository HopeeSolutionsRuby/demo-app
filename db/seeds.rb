# frozen_string_literal: true

require 'factory_bot'
require 'faker'
include FactoryBot::Syntax::Methods

Faker::Config.locale = 'vi'

Account.destroy_all

10.times do
  password = "123456"
  phone = Faker::PhoneNumber.unique.cell_phone_in_e164
  email = Faker::Internet.unique.email(domain: 'gmail.com')

  Account.create!(
    password: password,
    phone: phone,
    email: email
  )
end
