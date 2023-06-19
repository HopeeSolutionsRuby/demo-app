# frozen_string_literal: true

class TeacherPoly < ApplicationRecord
  has_many :posts, as: :postable, dependent: :restrict_with_exception
end
