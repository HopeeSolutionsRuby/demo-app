# frozen_string_literal: true

# Custom validate
class Myvalidator < ActiveModel::Validator
  def validate(record)
    return if record.name.start_with? 'X'

    record.errors.add :name, 'Need a name starting with X please!'
  end
end