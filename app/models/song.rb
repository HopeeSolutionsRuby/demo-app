# frozen_string_literal: true

class Song < ApplicationRecord

  belongs_to :artist, counter_cache: true 
  belongs_to :genre

  after_create :create_song


  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  def create_song
    Rails.logger.debug 'Song created'
  end
end
