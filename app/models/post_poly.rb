class PostPoly < ApplicationRecord
  belongs_to :postable, polymorphic: true
end
