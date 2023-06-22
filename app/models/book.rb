# frozen_string_literal: true

# Model for book
class Book < ApplicationRecord
  has_many :reviews, as: :rvtable, dependent: :destroy

  enum :status, { read: 0, reading: 1, wtr: 2, dnf: 3 }
end
