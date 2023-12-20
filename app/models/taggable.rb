# frozen_string_literal: true

class Taggable < ApplicationRecord
  belongs_to :customer
  belongs_to :tag
end
