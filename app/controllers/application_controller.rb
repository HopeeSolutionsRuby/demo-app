# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  protect_from_forgery with: :exception

  before_action :authenticate_account!

  private

  def pundit_user
    current_account
  end
end
