# frozen_string_literal: true

class Movie < ApplicationRecord
  belongs_to :course
  before_save :set_default_rating
  # after_create :notify_subscribers
  before_destroy :check_associations
  validates :title, presence: true
  # validate :release_year_cannot_be_in_the_future

  private

  # def notify_subscribers
  #   SubscriptionMailer.notify_movie_creation(self).deliver_now
  # end

  def check_associations
    if course.present? || lab.present?
      errors.add(:base, "Cannot delete movie with associated course or lab")
      throw(:abort)
    end
  end

  def set_default_rating
    self.rate ||= 0
  end

  # def release_year_cannot_be_in_the_future
  #   errors.add(:release_year, "can't be in the future") if release_year.present? && Date.parse(release_year, "%d/%m/%Y") < Date.today
  # end
end
