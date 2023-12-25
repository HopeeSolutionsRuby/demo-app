# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :customers, through: :taggables

  validates :name, presence: true, length: { maximum: 255 }
end
