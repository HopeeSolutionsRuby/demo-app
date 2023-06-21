class Movie < ApplicationRecord
  has_many :reviews, as: :rvtable, dependent: :destroy

  before_validation :normalize_name, on: :create

  validates :title, :director, :length, presence: true
  
  private
    def normalize_name
      self.title = title.downcase.titleize
    end

end
