class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  around_save :log_save
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  def log_save
    puts "Before saving the user"
    yield
    puts "After saving the user"
  end
end
