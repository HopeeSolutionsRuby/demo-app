# frozen_string_literal: true

class Profile < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user
  validates :name, presence: true
  validates :age, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates_associated :user
  # scope :youngest, -> { order(':age :asc') }
  def self.ransackable_attributes(_auth_object = nil)
    %w[age created_at email id name updated_at user_id]
  end
  scope :search_by_age_gt, ->(age) { ransack(age_gt: age, s: 'age asc').result }
  scope :youngest, -> { ransack('').result.order(age: :asc).limit(5) }
  scope :get_user_with_status, ->(status) { joins(:user).merge(User.ransack(status_eq: status).result) }
end
