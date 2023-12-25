# frozen_string_literal: true

class Customer < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  enum gender: { male: 0, female: 1, other: 2 }

  mount_uploader :avatar, AvatarUploader

  def self.ransackable_attributes(_auth_object = nil)
    %w[address age avatar created_at email encrypted_password full_name tag_name_cont id id_value phone
       remember_created_at reset_password_sent_at reset_password_token gender updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables

  validates :age, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :full_name, presence: true, length: { maximum: 255 }
  validates :gender, presence: true, inclusion: { in: %w[male female other], message: '%<value> is not a valid gender' }

  def self.not_send_email
    def send_devise_notification(notification, *args); end
  end

  def not_send_email
    def send_devise_notification(notification, *args); end
  end
end
