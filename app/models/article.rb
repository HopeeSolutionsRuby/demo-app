# frozen_string_literal: true

# Article model
class Article < ApplicationRecord
  belongs_to :user
  has_many  :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true, length: { minimum: 6, maximum: 10 }

  # custom validate
  validate :description_blank
  before_validation :title_upcase

  private

  def title_upcase
    self.title = title.upcase
  end

  def description_blank
    errors.add(:description, 'description is blank') if description.blank?
  end
end
