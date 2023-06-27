# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :songs
  has_many :artists, through: :songs

  after_touch :log_genre

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  scope :songs, -> { where(songs: true) }
  scope :artists, -> { where(artists: 'Adele') }

  private

  def log_genre
    Rails.logger.debug 'This genre was touched'
  end
end
