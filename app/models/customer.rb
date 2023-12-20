# frozen_string_literal: true

class Customer < ApplicationRecord
  # validates :phone, numericality: { only_integer: true, message: 'Please enter only numbers' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  
  def self.not_send_email
    def send_devise_notification(notification, *args); end
  end
  
  enum gender: { Male: 0, Female: 1, Other: 2}

  mount_uploader :avatar, AvatarUploader
  def self.ransackable_attributes(_auth_object = nil)
    %w[address age avatar created_at email encrypted_password full_name tags id id_value phone
       remember_created_at reset_password_sent_at reset_password_token sex updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
