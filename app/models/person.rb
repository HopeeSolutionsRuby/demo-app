# frozen_string_literal: true

# Class model for Person
class Person < ApplicationRecord
  validates :name, :age, presence: true
  # validates_with Myvalidator

  before_create :message

  def message
    puts 'you will create a model'
  end
end
