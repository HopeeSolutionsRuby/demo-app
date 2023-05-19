class ProfilesController < ApplicationController
  before_action :set_user, only: [:show]

  # def index 
  #   @profiles = Profile.all
  #   render :index
  # end 

  def show
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.find_by(user_id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @profile = Profile.find_by(user_id: params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Profile updated"
      redirect_to profile_path
    else
      render 'edit'
    end
    puts params
    puts profile_params
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end


  def profile_params
    params.require(:profile).permit(:address, :sex, :date_of_birth)
  end
end
