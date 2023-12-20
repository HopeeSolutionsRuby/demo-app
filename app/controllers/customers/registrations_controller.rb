# frozen_string_literal: true

module Customers
  # Class RegistrationsController
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name address avatar])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name address age avatar])
    end
  end
end
