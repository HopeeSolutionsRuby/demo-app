# frozen_string_literal: true

module UserActivities
  module Register
    extend ActiveSupport::Concern

    included do
      after_create :register_user
    end

    def register_user
      send_registration_email
      //
    end

    def send_registration_email
      Rails.logger.debug { "send email to #{email}" }
    end
  end
end
