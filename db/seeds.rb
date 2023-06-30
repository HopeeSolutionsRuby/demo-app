# frozen_string_literal: true
require 'factory_bot'
require 'faker'
include FactoryBot::Syntax::Methods

Host.destroy_all
User.destroy_all
hosts = Host.all
posts = Post.all
users = User.all

5.times do
  Host.create!(name: Faker::Computer.unique.platform.upcase)
end

hosts.each do |host|
  rand(3..10).times do
    host.users.create!(
      name: Faker::Name.unique.last_name,
      status: Faker::Boolean.boolean,
      password: 'pass1',
      password_confirmation: 'pass1',
      recovery_password: "42password"
    )
  end
  # puts "User #{host+1} create successfully."
end

100.times do
  user = users.sample
  post = posts.sample
  Comment.create!(
    content: Faker::Games::StreetFighter.unique.quote,
    user_id: user.id,
    post_id: post.id
  )
end

# users = User.all

# users.each do |user|
#   rand(3..5).times do
#     user.posts.create!(title: Faker::Book.unique.title, body: Faker::Lorem.paragraph, state: rand(0..2))
#   end
# end


# Comment.destroy_all

# posts.each do |post|
#   post.comments.create(content: Faker::Games::StreetFighter.unique.quote, commentable: post.user)
# end






# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# 5.times do
#   create(:admin)
# end
# user = User.find_by(id: 6)
# post = user.posts.create(title: "TITLE", body: "Contentttttt")

# User.destroy_all

# 10.times do
#   User.create!(
#     name: Faker::Games::StreetFighter.unique.character,
#     email: Faker::Internet.unique.email
#   )
# end


# Post.destroy_all

# 20.times do
#   Post.create!(
#     title: Faker::Games::StreetFighter.unique.stage,
#     body: Faker::Games::StreetFighter.quote
#   )
# end

# Profile.destroy_all

# users = User.all

# users.each do |user|
#   profile = Profile.new
#   profile.user = user
#   profile.name = user.name
#   profile.birthday = Faker::Date.birthday
#   profile.address = Faker::Games::StreetFighter.stage
#   profile.save
# end
