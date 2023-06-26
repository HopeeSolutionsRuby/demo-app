# frozen_string_literal: true

class Person
  include ActiveModel::Serialization
  include ActiveModel::Validations
  include ActiveModel::API

  attr_accessor :name, :age, :omg

  validates :name, :age, presence: { strict: true }

  def attributes
    { 'name' => nil, 'age' => nil }
  end

  def capitalized_name
    name.capitalize
  end

  def persisted?
    id.present?
  end

  def initialize(attributes = {})
    super
    @omg ||= true
  end
end

class MyValidator < ActiveModel::Validator
  def validate(record)
    return unless some_complex_logic

    record.errors.add(:base, 'This record is invalid')
  end

  private

  def some_complex_logic; end
end
