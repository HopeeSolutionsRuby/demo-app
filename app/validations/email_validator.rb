# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/

    record.errors.add attribute, (options[:message] || 'is not an valid email')
  end
end
