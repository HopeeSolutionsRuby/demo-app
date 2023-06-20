# frozen_string_literal: true

class StudentPoly < ApplicationRecord
  has_many :posts, as: :postable, dependent: :restrict_with_exception
  validates :name, presence: true, name: true
  validates :faculty, presence: true
end
