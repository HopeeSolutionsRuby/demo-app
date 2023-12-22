# frozen_string_literal: true

module Administrator
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    protected

    def after_sign_up_path_for(resource)
      stored_location_for(resource) || administrator_dashboard_index_path
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation])
    end
  end
end
