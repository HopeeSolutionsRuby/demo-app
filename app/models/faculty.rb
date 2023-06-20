# frozen_string_literal: true

class Faculty < ApplicationRecord
  has_many :students, dependent: :restrict_with_exception
  has_many :subjects, dependent: :restrict_with_exception
  validates :name, presence: true, uniqueness: true
  before_save :add_f

  def add_f
    self.name = "F_#{name}"
  end
end
