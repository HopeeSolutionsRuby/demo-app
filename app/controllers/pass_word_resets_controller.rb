class PassWordResetsController < ApplicationController
  # before_action :get_user,   only: [:edit, :update]
  # before_action :valid_user, only: [:edit, :update]
  # before_action :check_expiration, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    if @user = current_user
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver_now
      flash[:info] = "Email sent with password reset instructions"
    elsif @user = User.find_by(email: params[:email])
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver_now
      flash[:info] = "Email sent with password reset instructions"
      redirect_to login_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
    if @user = current_user || @user = User.find_by(email: params[:email])
      render 'edit'
    else
      flash[:danger] = "Invalid or expired password reset token"
      redirect_to new_pass_word_reset_url
    end
  end

  def update
    if @user = current_user || @user = User.find_by(mail: params[:email])
      if @user.update(user_params)
        flash[:success] = "Password has been reset."
        redirect_to @user
      else
        render 'edit'
      end
    else
      flash[:danger] = "Invalid or expired password reset token"
      redirect_to new_password_reset_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(mail: params[:email])
  end

  def valid_user
    unless (@user && @user.activated? &&
        @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # def check_expiration
  #   if @user.password_reset_expired?
  #     flash[:danger] = "Password reset has expired."
  #     redirect_to new_password_reset_url
  #   end
  # end
end
