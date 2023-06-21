class Song < ApplicationRecord
	belongs_to :artist 
	belongs_to :genre

	after_create :create_song

	def create_song
		puts "Song created" 
	end 
 
end