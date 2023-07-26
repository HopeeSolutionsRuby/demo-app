# frozen_string_literal: true

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_update :update_avatar_version
  after_update :update_avatar_version
  after_destroy :delete_avatar_directory
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :employee, inverse_of: :account, dependent: :destroy

  # validates :phone, phone: true, uniqueness: true, unless: -> { phone.blank? }

  after_destroy :delete_avatar_directory

  enum role: { employee: 0, employer: 1, admin: 2 }

  mount_uploader :avatar, AvatarUploader

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
