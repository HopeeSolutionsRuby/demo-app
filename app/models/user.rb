# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :normalize_name
  around_save :log_save
  has_many :posts, class_name: 'Post'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  def log_save
    Rails.logger.debug 'Before saving the user'
    yield
    Rails.logger.debug 'After saving the user'
  end

  def normalize_name
    self.name = name.downcase if name.present?
  end
end
