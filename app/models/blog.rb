# frozen_string_literal: true

# Class model for blog
class Blog < ApplicationRecord
  belongs_to :student, counter_cache: true
end
