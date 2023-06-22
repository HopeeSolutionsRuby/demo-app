# frozen_string_literal: true

# Model review
class Review < ApplicationRecord
  belongs_to :rvtable, polymorphic: true
end
