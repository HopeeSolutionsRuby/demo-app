# frozen_string_literal: true

class UniqueNameValidator < ActiveModel::Validator
  def validate(record)
    return unless Author.exists?(name: record.name)

    record.errors.add(:name, 'must be unique')
  end
end
