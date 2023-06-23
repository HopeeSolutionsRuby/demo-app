# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::SecurePassword
  include GeneralCallbacks
  include UserCallbacks

  attr_accessor :is_guest, :password_digest

  serialize :preferences
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
  scope :age_over, ->(age) { joins(:profile).where('profiles.age > ?', age) }
  scope :youngest, -> { joins(:profile).order('profiles.age ASC').limit(5) }
  scope :by_status, ->(status) { where(status: status) }
  def errors
    super.tap { |errors| errors.delete(:password, :blank) if is_guest }
  end
end
