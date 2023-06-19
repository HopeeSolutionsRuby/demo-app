# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :faculty
  validates :name, uniqueness: true
  validates :name, exclusion: { in: %w[Magic Circle Poppin], message: '%<value>s is exclusion.' }
  validates :credit, numericality: { in: 1..5 }
  after_find :hura
  def hura
    Rails.logger.debug 'Huraaa!'
  end
end
