# frozen_string_literal: true

module EmployeeActivities
  extend ActiveSupport::Concern
  include Capitalizable

  included do
    after_create :send_email_register
    capitalize_attribute :first_name
    capitalize_attribute :last_name
  end

  private

  def send_email_register
    # send email
  end
end
