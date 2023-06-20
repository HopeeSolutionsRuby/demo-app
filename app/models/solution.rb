class Solution < ApplicationRecord
  has_many :comments, as: :commentable
end
