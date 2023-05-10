# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :movable, polymorphic: true
  before_save :set_default_rating
  after_create :notify_subscribers
  before_destroy :check_associations
  validates :title, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validate :release_date_cannot_be_in_the_future

  private

  def notify_subscribers
    SubscriptionMailer.notify_movie_creation(self).deliver_now
  end

  def check_associations
    if course.present? || lab.present?
      errors.add(:base, "Cannot delete movie with associated course or lab")
      throw(:abort)
    end
  end

  def set_default_rating
    self.rating ||= 0
  end

  def release_date_cannot_be_in_the_future
    errors.add(:release_date, "can't be in the future") if release_date.present? && release_date > Date.today
  end
end
