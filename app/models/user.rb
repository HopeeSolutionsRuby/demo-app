# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::SecurePassword
  include GeneralCallbacks
  include UserCallbacks

  attr_accessor :is_guest, :password_digest

  serialize :properties, JSON
  belongs_to :host, counter_cache: true
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  has_secure_password :recovery_password, validations: false
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  enum status: {
    active: true,
    do_not_disturb: false
  }
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "host_id", "id", "name", "password_digest", "posts_count", "properties", "recovery_password_digest", "status", "updated_at"]
  end
  # scope :age_over, ->(age) { joins(:profile).where('profiles.age > ?', age) }
  scope :age_over, ->(age) { joins(:profile).merge(Profile.search_by_age_gt(age)) }
  scope :youngest, -> { joins(:profile).merge(Profile.youngest)}
  scope :by_status, ->(status) { ransack(status: status).result }
  def errors
    super.tap { |errors| errors.delete(:password, :blank) if is_guest }
  end
end
