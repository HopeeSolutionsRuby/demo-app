# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if URI::MailTo::EMAIL_REGEXP.match?(value)

    record.errors.add attribute, (options[:message] || 'is not an email')
  end
end
