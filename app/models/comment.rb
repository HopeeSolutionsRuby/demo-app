# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates :body, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  before_validation :strip_content_whitespace
  after_create :notify_user

  private

  def notify_user
    NotificationMailer.new_comment(self).deliver_later
  end

  def strip_content_whitespace
    content.strip!
  end
end
