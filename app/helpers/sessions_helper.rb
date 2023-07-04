# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user] = user
  end

  def log_out
    session.clear
  end

  def logged_in?
    session[:user]
  end
end
