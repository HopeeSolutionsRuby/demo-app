# frozen_string_literal: true

class Student < ApplicationRecord
  include GeneralCallbacks
  belongs_to :class_room, counter_cache: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "first_name", "first_name","updated_at"]
  end

end
