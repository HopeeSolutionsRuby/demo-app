 # frozen_string_literal: true

class Result < ApplicationRecord
  include SaveCallback

  belongs_to :student, counter_cache: :results_count
  belongs_to :term

  validates :point, numericality: { in: 0..10 }
end
