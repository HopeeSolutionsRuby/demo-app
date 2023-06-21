class Artist < ApplicationRecord
	has_many :songs 
	has_many :genre, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    self.songs.first
  end
end
