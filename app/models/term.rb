# frozen_string_literal: true

class Term < ApplicationRecord
  belongs_to :subject
  has_many :results, dependent: :destroy
  has_many :students, through: :results
end
