# frozen_string_literal: true

class BookValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:author_id, 'must be an integer') if record.author_id < 1

    # unless record.published_at.nil? || record.published_at.is_a?(Time)
    #   record.errors.add(:published_at, "must be a valid date and time")
    # end
    return unless record.published_at.nil?

    record.errors.add(:published_at, 'must be a valid date and time')
  end
end
