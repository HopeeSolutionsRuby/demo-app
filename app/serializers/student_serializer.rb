# frozen_string_literal: true

class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :marks
end
