# frozen_string_literal: true

class Post < ApplicationRecord
  include PostCallbacks
  belongs_to :user, class_name: 'User'
  # validate the tile and body
  # validate that the title has a length of at least 5
  validates :title, presence: true # , length: { minimum: 5, maximum: 7 }
  # validate that the title has a length of at least 5
  validates :body, presence: true # , length: { minimum: 10 }
  validates_with TitleUniquenessValidator
  # validates_with TitleUniquenessValidator
end
