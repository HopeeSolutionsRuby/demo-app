# frozen_string_literal: true

# Class model for Person
class Person < ApplicationRecord
  validates :name, :age, presence: true
  validates_with Myvalidator

  after_commit :message

  def message
    Rails.logger.debug { "User created: #{Person.inspect}" }
  end
end
