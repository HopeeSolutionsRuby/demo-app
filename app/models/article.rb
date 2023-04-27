class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 10 }, uniqueness: true

  #custom validate
  validate :description_blank
  before_validation :title_upcase

  private

  def title_upcase
    self.title = title.upcase
  end

  def description_blank
  	errors.add(:description, 'description is blank') if description.empty?
  end
end
