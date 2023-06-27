# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :genre, through: :songs


  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  def get_genre_of_first_song
    # return the genre of the artist's first saved song
    songs.first
  end
end
