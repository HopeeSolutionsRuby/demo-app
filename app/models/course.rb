# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :teaching_assistants, as: :ta_duty, dependent: :destroy
  belongs_to :user
  has_many :movies, as: :movable
  has_many :comments, as :commentable
  belongs_to :professor
  before_commit :notify_user, on: :create
  after_commit :send_welcome_email

  private

  def notify_user
    flash[:notice] = 'You had rolled into this course' if course.user_id.include?(user_id)
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
