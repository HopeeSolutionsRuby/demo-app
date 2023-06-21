# frozen_string_literal: true

class User < ApplicationRecord
  include GeneralCallbacks
  include UserCallbacks
  belongs_to :host, counter_cache: true
  has_one :profile, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  scope :age_over, ->(age) { joins(:profile).where('profiles.age > ?', age) }
  scope :youngest, -> {joins(:profile).order('profiles.age ASC').limit(5)}
end
