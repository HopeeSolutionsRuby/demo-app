class Genre < ApplicationRecord
	has_many :songs
	has_many :artists, through: :songs

	after_touch :log_genre 

	private 
	def log_genre
		puts "This genre was touched"
	end  
end