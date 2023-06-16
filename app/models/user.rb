class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  around_save :log_save
  before_validation :normalize_name
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  def log_save
    puts "Before saving the user"
    yield
    puts "After saving the user"
  end
  def normalize_name
  	self.name = name.downcase if name.present?
  end
end
