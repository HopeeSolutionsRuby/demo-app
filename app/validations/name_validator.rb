# frozen_string_literal: true

class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?

    error_messages = []
    error_messages << 'Not this name' if value == 'Nguyen Hong Tu'
    error_messages << 'You have an ugly name' if value.size > 100

    record.errors.add(attribute, error_messages) if error_messages.present?
  end
end
