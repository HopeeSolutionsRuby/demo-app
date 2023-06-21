# frozen_string_literal: true

class Subject < ApplicationRecord
  include FindCallback

  belongs_to :faculty
  validates :name, uniqueness: true
  has_one :term, dependent: :destroy

  validates :name, exclusion: { in: %w[Magic Circle Poppin], message: '%<value>s is exclusion.' }
  validates :credit, numericality: { in: 1..5 }
end
