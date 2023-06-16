# frozen_string_literal: true
require 'factory_bot'
require 'faker'
include FactoryBot::Syntax::Methods
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
SIZE_PRODUCT = 20
SIZE_CATEGORY = 5
SIZE_ORDER = 10
SIZE_ORDER_LINE = 5
SIZE_USER = 10

SIZE_USER.times do 
  create(:admin)
end

(1..SIZE_CATEGORY).each do
  Category.create(name: Faker::Book.genre)
end

(1..SIZE_PRODUCT).each do 
  Product.create(name: Faker::Book.title, 
    price: Faker::Number.within(range: 50000..1000000),
    description: Faker::Book.author, 
    image: Faker::Book.publisher, 
    category_id: rand(1..5))
end

(1..SIZE_ORDER).each do
  Order.create(date: Faker::Date.between(from: '2014-09-23', to: '2015-09-25'),
  total: Faker::Number.within(range: 100000..1000000),
  admin_id: rand(1..SIZE_USER))
end

(1..SIZE_ORDER).each do |i|
  (1..rand(1..SIZE_ORDER_LINE)).each do
      OrderLine.create(order_id: i, product_id: rand(1..SIZE_PRODUCT), quantity: rand(1..10))
  end
end
