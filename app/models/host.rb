# frozen_string_literal: true

class Host < ApplicationRecord
  include GeneralCallbacks
  has_many :users, dependent: :destroy
  validates :name, presence: true, length: { maximum: 15 }
  validate :name_upcase
  validate :name_unique

  private

  def name_upcase
    errors.add(:name, 'must be in uppercase') if name.present? && name != name.upcase
  end

  def name_unique
    errors.add(:name, 'already') if name.present? && Host.exists?(name: name)
  end
end
