# frozen_string_literal: true

class Comment < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :restrict_with_exception, inverse_of: :commentable

  belongs_to :commentable, polymorphic: true, inverse_of: :comments
  belongs_to :owner, polymorphic: true, inverse_of: :comments
end
