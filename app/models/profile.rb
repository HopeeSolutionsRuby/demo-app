# frozen_string_literal: true

class Profile < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user
  validates :name, presence: true
  validates :age, presence: true 
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  scope :youngest, -> {order(":age :asc")}
end
