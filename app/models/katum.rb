class Katum < ApplicationRecord
  has_many :comments, as: :commentable
end
