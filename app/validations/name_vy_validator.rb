# frozen_string_literal: true

class NameVyValidator < ActiveModel::Validator
  def validate(record)
    return unless record.first_name != 'Vy'

    record.errors.add :first_name, 'Name must be Vy'
  end
end
