# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_account!

  private

  def authenticate_account!
    return if account_signed_in? || devise_controller?

    redirect_to signin_path
  end
end
