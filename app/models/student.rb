# frozen_string_literal: true

class Student < ApplicationRecord
  include GeneralCallbacks
  belongs_to :class_room, counter_cache: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
