# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, class_name: 'User'
  around_save :log_save
  # validate the tile and body
  # validate that the title has a length of at least 5
  validates :title, presence: true, length: { minimum: 5, maximum: 7 }
  # validate that the title has a length of at least 5
  validates :body, presence: true, length: { minimum: 10 }

  # validates :user_id

  validate :title_must_be_all_caps

  validate :title_must_be_unique

  def title_must_be_all_caps
    return if title == title.upcase

    errors.add(:title, 'must be all caps')
  end

  def title_must_be_unique
    errors.add(:title, 'must be unique') if title.present? && Post.exists?(title: title)
  end

  def log_save
    Rails.logger.debug 'Before saving the post'
    yield
    Rails.logger.debug 'After saving the post'
  end
end
