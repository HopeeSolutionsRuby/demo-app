class Subject < ApplicationRecord
  belongs_to :faculty
  validates :name, uniqueness: true
  validates :credit, numericality: { in: 1..5 }
  after_find :hura
  def hura
    Rails.logger.debug 'Huraaa!'
  end
end
