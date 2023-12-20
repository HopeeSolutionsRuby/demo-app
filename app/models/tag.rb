# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :posts, through: :taggables
end
