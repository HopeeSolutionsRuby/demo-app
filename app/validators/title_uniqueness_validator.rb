# frozen_string_literal: true

class TitleUniquenessValidator < ActiveModel::Validator
  def validate(record)
    return unless record.title.present? && Post.exists?(title: record.title)

    record.errors.add(:title, 'must be unique')
  end
end
