# frozen_string_literal: true

class Term < ApplicationRecord
  belongs_to :subject
  has_many :results, dependent: :restrict_with_exception
  has_many :students, through: :results
  validates_associated :subjects
end
