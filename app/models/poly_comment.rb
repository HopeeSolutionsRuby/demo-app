class PolyComment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
