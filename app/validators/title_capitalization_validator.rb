# frozen_string_literal: true

class TitleCapitalizationValidator < ActiveModel::Validator
  def validate(record)
    return if record.title == record.title.upcase

    record.errors.add(:title, 'must be all caps')
  end
end
