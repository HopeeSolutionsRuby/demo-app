# frozen_string_literal: true

class Profile < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user
  validates :name, presence: true
  scope :youngest, -> {order(:age :asc)}
end
