# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      log_in @user
      redirect_to root_path
    else
      flash[:alert] = ['Invalid email or password']
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
