# frozen_string_literal: true

class Blog < ApplicationRecord
  has_many :comments, as: :commentable, inverse_of: :commentable, dependent: :restrict_with_exception
  belongs_to :admin, inverse_of: :blogs

  validates_associated :admin
end
