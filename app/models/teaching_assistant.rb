# frozen_string_literal: true

class TeachingAssistant < ApplicationRecord
  belongs_to :professors
  belongs_to :user
  belongs_to :ta_duty, polymorphic: true
  after_commit :send_welcome_email

  # private

  # def send_welcome_email
  #   UserMailer.welcome_email(self).deliver_now
  # end
end
