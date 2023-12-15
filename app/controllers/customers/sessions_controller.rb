# frozen_string_literal: true

module Customers
  # Class SessionsController
  class SessionsController < Devise::SessionsController
    # GET /resource/sign_in
    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    rescue Devise::AuthenticationError
      flash[:alert] = 'Invalid email or password. Please try again.'
      redirect_to new_customer_session_path
    end
  end
end
