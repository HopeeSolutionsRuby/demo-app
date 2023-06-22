# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :artist, counter_cache: true 
  belongs_to :genre

  after_create :create_song

  def create_song
    Rails.logger.debug 'Song created'
  end
end
