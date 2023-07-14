# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, phone: true, uniqueness: true, unless: -> { phone.blank? }

  after_update :update_avatar_version
  after_destroy :delete_avatar_directory

  enum role: { employee: 0, employer: 1, admin: 2 }
  has_one :employer, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def self.ransackable_attributes(_auth_object = nil)
    %w[avatar created_at email encrypted_password id phone remember_created_at
       reset_password_sent_at reset_password_token role updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  private

  def delete_avatar_directory
    avatar_path = File.join('public', 'uploads', 'account', 'avatar', id.to_s)
    FileUtils.rm_rf(avatar_path)
  end

  def update_avatar_version
    avatar.store!
    avatar.recreate_versions!
  end
end
