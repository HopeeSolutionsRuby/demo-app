class Student < ApplicationRecord
  include ActiveModel::Validations

  has_many :results
  validates_associated :results
  belongs_to :faculty

  validates :name, presence: true, uniqueness: true, name: true
  validates :year, numericality: { in: 1..4 }

  before_validation :check_name

  def check_name
    return unless name == 'Tu dep trai'

    Rails.logger.debug 'Nah nah! This is a beautiful name'
    throw :abort
  end
end
