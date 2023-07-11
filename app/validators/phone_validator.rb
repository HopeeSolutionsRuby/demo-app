# frozen_string_literal: true

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ || value.blank?

    record.errors.add attribute, (options[:message] || 'is not phone')
  end
end
