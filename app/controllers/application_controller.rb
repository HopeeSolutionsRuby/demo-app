# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  protect_from_forgery with: :exception

  before_action :authenticate_account!
  before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone role avatar password_confirmation])
  end

  private

  def pundit_user
    current_account
  end
end
