# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
  end
end
