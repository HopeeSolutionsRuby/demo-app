# frozen_string_literal: true

class Jobcategory < ApplicationRecord
  validates :country, :category_name, :job_category_status, :description, presence: true

  before_create :set_default_country

  def set_default_country
    Rails.logger.debug 'Job Location is Vietnam'
    return unless country.nil?

    self.country = 'Vietnam'
  end
end
