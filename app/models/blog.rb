# frozen_string_literal: true

class Blog < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :restrict_with_exception, inverse_of: :blog
  belongs_to :admin, inverse_of: :blogs

  validates_associated :admin
end
