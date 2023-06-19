class StudentPoly < ApplicationRecord
  has_many :posts, as: :postable, dependent: :restrict_with_exception
end
