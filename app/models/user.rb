# frozen_string_literal: true

class User < ApplicationRecord
  include UserCallbacks
  has_many :posts, class_name: 'Post'
  has_one :profile
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
