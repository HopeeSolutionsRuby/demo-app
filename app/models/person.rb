# frozen_string_literal: true

class Person
  include ActiveModel::Serialization

  attr_accessor :name, :age

  def attributes
    { 'name' => nil, 'age' => nil }
  end

  def capitalized_name
    name.capitalize
  end
end
