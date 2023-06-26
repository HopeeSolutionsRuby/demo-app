# frozen_string_literal: true

# Model game
class Game < ApplicationRecord
  has_many :reviews, as: :rvtable, dependent: :destroy

  serialize :descriptions, JSON
  serialize :playtime, Duration

  delegate :minutes, :minutes=, :hours, :hours=, to: :playtime
end
