# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :student, counter_cache: :results_count
  belongs_to :term

  validates :point, numericality: { in: 0..10 }

  after_validation :notifi
  around_save :say_something

  def say_something
    Rails.logger.debug 'Try hard to get high point'
    yield
    Rails.logger.debug 'Ok nice try'
  end

  def notifi
    Rails.logger.debug 'Du lieu nhap vao ko hop le, hen gap lai lan sau'
  end
end
