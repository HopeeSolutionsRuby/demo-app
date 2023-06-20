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
SIZE_PRODUCT = 30
SIZE_CATEGORY = 10
SIZE_ORDER = 50
SIZE_ORDER_LINE = 5
SIZE_USER = 30

SIZE_USER.times do 
  create(:admin)
end

SIZE_USER.times do 
  User.create(first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    phone: Faker::PhoneNumber.cell_phone, 
    username: Faker::Internet.username,
    email: Faker::Internet.email)
end

(1..SIZE_CATEGORY).each do
  Category.create(name: Faker::Book.genre)
end

(1..SIZE_PRODUCT).each do
  Product.create(name: Faker::Book.title, 
    price: Faker::Number.within(range: 5000..100000),
    description: Faker::Book.author, 
    category_id: rand(1..SIZE_CATEGORY))
end

Payment.create(name: "Cash")
Payment.create(name: "MoMo")
Payment.create(name: "ZaloPay")
Payment.create(name: "Internet Banking")

(1..SIZE_ORDER).each do |i|
  # Orders faked
  Order.create(date: Faker::Date.between(from: '2014-09-23', to: '2023-05-25'),
  total: Faker::Number.within(range: 100000..1000000),
  user_id: rand(1..SIZE_USER),
  status: rand(0..3))
end

(1..SIZE_ORDER).each do |i|
  # Bills faked
  Bill.create(date: Faker::Date.between(from: '2014-09-23', to: '2023-05-25'), order_id: i, status: rand(0..3))
end

(1..SIZE_ORDER).each do |i|
  # Order-lines faked
  (1..rand(1..SIZE_ORDER_LINE)).each do
    OrderLine.create(order_id: i, product_id: rand(1..SIZE_PRODUCT), quantity: rand(1..10))
  end
end

(1..SIZE_ORDER).each do |i|
  # Bill-lines faked
  (1..rand(1..SIZE_ORDER_LINE)).each do
    BillLine.create(bill_id: i, payment_id: rand(1..4), amount: Faker::Number.within(range: 100000..1000000), status: rand(0..3))
  end
end

# Images faked
(1..SIZE_USER).each do |i|
  Image.create(imageable_type: 'User', imageable_id: i, link: "path/to/images/of/user#{i}")
  Image.create(imageable_type: 'Admin', imageable_id: i, link: "path/to/images/of/admin#{i}")
  Image.create(imageable_type: 'Product', imageable_id: i, link: "path/to/images/of/product#{i}")
end

# Blogs faked
(1..SIZE_USER).each do |i|
  Blog.create(name: Faker::Quote.famous_last_words,
    short_description: Faker::Quote.jack_handey,
    content: Faker::Quote.matz,
    admin_id: rand(1..SIZE_USER))
end

# Comments faked
(1..SIZE_USER).each do |i|
  Comment.create(content: "comment#{i}", commentable_type: %w[Product Blog].sample, commentable_id: i, owner_type: 'User', owner_id: rand(1..SIZE_USER))
end

(1..SIZE_USER).each do |i|
  Comment.create(content: "comment#{i}", commentable_type: "Comment", commentable_id: i, owner_type: %w[Admin User].sample, owner_id: rand(1..SIZE_USER))
end
