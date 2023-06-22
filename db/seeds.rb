# frozen_string_literal: true
require 'factory_bot'
require 'faker'
include FactoryBot::Syntax::Methods

Host.destroy_all 

5.times do 
  Host.create!(name: Faker::Computer.unique.platform.upcase)
end

User.destroy_all

hosts = Host.all 

hosts.each do |host|
  rand(3..10).times do 
    host.users.create!(
      name: Faker::Name.unique.name,
      status: Faker::Boolean.boolean
    )
  end
end 







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
