class Result < ApplicationRecord
  belongs_to :student
  belongs_to :term

  validates :point, numericality: { in: 0..10 }

  around_save :say_something
  after_validation :notifi

  def say_something
    Rails.logger.debug 'Try hard to get high point'
    yield
    Rails.logger.debug 'Ok nice try'
  end

  def notifi
    Rails.logger.debug 'Du lieu nhap vao ko hop le, hen gap lai lan sau'
  end
end
