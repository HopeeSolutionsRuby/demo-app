class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

