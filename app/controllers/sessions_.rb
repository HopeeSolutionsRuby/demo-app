class SessionsController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

    render 'login'
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      log_in user
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
