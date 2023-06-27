# frozen_string_literal: true

class Host < ApplicationRecord
  include GeneralCallbacks
  has_many :users, dependent: :destroy
  validates :name, presence: true, length: { maximum: 15 }
  validate :name_upcase
  validate :name_unique

  scope :users_by_host_id, ->(host_id) { joins(:users).merge(User.ransack(status_eq: true,host_id_eq: host_id).result.select('users.*')) }

  private

  def name_upcase
    errors.add(:name, 'must be in uppercase') if name.present? && name != name.upcase
  end

  def name_unique
    errors.add(:name, 'already') if name.present? && Host.exists?(name: name)
  end


end
