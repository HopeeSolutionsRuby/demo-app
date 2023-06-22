# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :songs
  has_many :artists, through: :songs

  after_touch :log_genre

  private

  def log_genre
    Rails.logger.debug 'This genre was touched'
  end
end
