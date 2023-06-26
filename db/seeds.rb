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
bohemian_rhapsody = Song.create(name: 'Bohemian Rhapsody')
hotel_california = Song.create(name: 'Hotel California')
shape_of_you = Song.create(name: 'Shape of You')
rolling_in_the_deep = Song.create(name: 'Rolling in the deep')
sweet_child_o_mine = Song.create(name: 'Sweet Child o Mine')
imagine = Song.create(name: 'Imagine')
hey_jude = Song.create(name:'Hey Jude')
i_will_always_love_you = Song.create(name: 'I will always love you')
smells_like_teen_spirit = Song.create(name: 'Smells like teen spirit')
hallelujah = Song.create(name: 'Hallelujah')
wonderwall = Song.create(name: 'Wonderwall')
someone_like_you = Song.create(name: 'Someone like you')
hey_ya = Song.create(name: 'Hey ya')
imagine_dragons = Song.create(name: 'Imagine Dragons')


drake = Artist.create(name: 'Drake')
mj = Artist.create(name: 'Michael Jackson')
queen = Artist.create(name: 'Queen')
eagles = Artist.create(name: 'Eagles')
ed_sheeran = Artist.create(name: 'Ed Sheeran')
adele = Artist.create(name: 'Adele')
guns_N_roses = Artist.create(name: 'GunsNRoses')
john_lenon = Artist.create(name: 'John Lenon')
the_beatles = Artist.create(name: 'The Beatles')
whitney_houston = Artist.create(name: 'Whitney Houston')
nirvana = Artist.create(name: 'Nirvana')
leonard_cohen = Artist.create(name: 'Leonard Cohen')
oasis = Artist.create(name: 'Oasis')
adele = Artist.create(name: 'Adele')
outkast = Artist.create(name: 'OutKast')
radioactive = Artist.create(name: 'Radioactive')


rap = Genre.create(name: 'Rap')
rock = Genre.create(name: 'Rock')
pop = Genre.create(name: 'Pop')
soul = Genre.create(name: 'Soul')
ballad = Genre.create(name: 'Ballad')
grunge = Genre.create(name: 'Grunge')
folk = Genre.create(name: 'Folk')
alternative = Genre.create(name: 'Alternative')
funk = Genre.create(name: 'Funk')
electronic = Genre.create(name: 'Electronic')


pop.songs << thriller
rap.songs << hotline_bling
rock.songs << bohemian_rhapsody
rock.songs << hotel_california
pop.songs << shape_of_you
soul.songs << rolling_in_the_deep
rock.songs << sweet_child_o_mine
ballad.songs << i_will_always_love_you
pop.songs << imagine
rock.songs << hey_jude
grunge.songs << smells_like_teen_spirit
folk.songs << hallelujah
alternative.songs << wonderwall
ballad.songs << someone_like_you
funk.songs << hey_ya
electronic.songs << imagine_dragons


hotline_bling.artist = drake
thriller.artist = mj 
bohemian_rhapsody.artist = queen
hotel_california.artist = eagles
shape_of_you.artist = ed_sheeran
rolling_in_the_deep.artist = adele
sweet_child_o_mine.artist = guns_N_roses
imagine.artist = john_lenon
hey_jude.artist = the_beatles
i_will_always_love_you.artist = whitney_houston
smells_like_teen_spirit.artist = nirvana
hallelujah.artist = leonard_cohen
wonderwall.artist = oasis
someone_like_you.artist = adele
hey_ya.artist = outkast
imagine_dragons.artist = radioactive


drake.songs << hotline_bling
mj.songs << thriller
queen.songs << bohemian_rhapsody
eagles.songs << hotel_california
ed_sheeran.songs << shape_of_you
adele.songs << rolling_in_the_deep
guns_N_roses.songs << sweet_child_o_mine
john_lenon.songs << imagine
the_beatles.songs << hey_jude
whitney_houston.songs << i_will_always_love_you
nirvana.songs << smells_like_teen_spirit
leonard_cohen.songs << hallelujah
oasis.songs << wonderwall
adele.songs << someone_like_you
outkast.songs << hey_ya
radioactive.songs << imagine_dragons

