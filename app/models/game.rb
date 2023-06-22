# frozen_string_literal: true

# Model game
class Game < ApplicationRecord
  has_many :reviews, as: :rvtable, dependent: :destroy
end
