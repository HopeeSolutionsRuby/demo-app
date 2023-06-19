# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true
  validates_with UniqueNameValidator
end
