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
5.times do 
  create(:admin)
end

Song.delete_all
Genre.delete_all
Artist.delete_all

hotline_bling = Song.create(name: 'Hotline Bling')
thriller = Song.create(name: 'Thriller')

drake = Artist.create(name: 'Drake')
mj = Artist.create(name: 'Michael Jackson')

rap = Genre.create(name: 'Rap')
pop = Genre.create(name: 'Pop')
action = Genre.create!(name: "Action")
comedy = Genre.create!(name: "Comedy")
drama = Genre.create!(name: "Drama")
romance = Genre.create!(name: "Romance")
thriller = Genre.create!(name: "Thriller")
fantasy = Genre.create!(name: "Fantasy")
documentary = Genre.create!(name: "Documentary")
adventure = Genre.create!(name: "Adventure")
animation = Genre.create!(name: "Animation")
scifi = Genre.create!(name: "Sci-Fi")

hotline_bling.artist = drake
thriller.artist = mj

drake.songs << hotline_bling
mj.songs << thriller

pop.songs << thriller
rap.songs << hotline_bling