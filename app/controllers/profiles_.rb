class ProfilesController < ApplicationController

  # def index 
  #   @profiles = Profile.all
  #   render :index
  # end

  def show
    @profile = Profile.find_by(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def edit
    if current_user
      @profile = Profile.find_by(user_id: params[:id])
      @user = User.find_by(id: params[:user_id])
    else
      redirect_to login_url
    end
  end

  def update
    @profile = Profile.find_by(user_id: params[:id])
    @user = User.find_by(id: params[:user_id])
    if @profile.update(profile_params)
      flash[:success] = "Profile updated"
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:address, :sex, :date_of_birth)
  end
end
