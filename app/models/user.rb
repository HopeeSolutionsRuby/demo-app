# frozen_string_literal: true

class User < ApplicationRecord
  before_destroy :delete_dependent_posts
  validates :name, presence: true, length: { in: 5..70 }
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w.-]+@[a-zA-Z]+\.[a-zA-Z]{2,}\z/, message: 'is invalid' }
  has_secure_password

  has_many :posts, dependent: :restrict_with_exception

  private

  def delete_dependent_posts
    return unless posts.exists?

    errors.add(:base, 'Cannot delete this user because of dependent post.')
    throw :abort
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "password_digest", "posts_count", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end
end
