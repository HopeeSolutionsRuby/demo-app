class Faculty < ApplicationRecord
  has_many :students
  validates :name, presence: true, uniqueness: true
  before_save :add_f

  def add_f
    self.name = "F_#{name}"
  end
end
