# frozen_string_literal: true

class Faculty < ApplicationRecord
  include SaveCallback

  has_many :students, dependent: :restrict_with_exception
  has_many :subjects, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
