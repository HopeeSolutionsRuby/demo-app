# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :poly_comments, as: :commentable
end
