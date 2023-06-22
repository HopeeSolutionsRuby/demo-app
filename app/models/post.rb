# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :poly_comments, as: :commentable
end
