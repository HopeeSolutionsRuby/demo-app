# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :genre, through: :songs

  def get_genre_of_first_song
    # return the genre of the artist's first saved song
    songs.first
  end
end
