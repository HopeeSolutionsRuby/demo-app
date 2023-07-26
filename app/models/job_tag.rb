# frozen_string_literal: true

class JobTag < ApplicationRecord
  validates :country, :job_id, :job_category_id, :description, presence: true

  before_create :set_default_country

  def set_default_country
    Rails.logger.debug 'Job Location is Vietnam'
    return unless country.nil?

    self.country = 'Vietnam'
  end
end
