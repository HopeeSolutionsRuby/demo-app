# frozen_string_literal: true

class Author < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :name, :country, :email, presence: true

  has_many :books, -> { order(year_published: :desc) }

  before_create :set_default_country

  before_update :set_default_email

  def set_default_country
    Rails.logger.debug 'I am in before_create block'
    return unless country.nil?

    self.country = 'Vietnam'
  end

  def set_default_email
    Rails.logger.debug 'I am in before_update block'
    return unless email.nil?

    self.email = 'author@example.com'
  end
end
