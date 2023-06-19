# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :birthday, presence: true
  validates :address, presence: true
end
