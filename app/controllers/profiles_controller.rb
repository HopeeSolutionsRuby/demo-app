class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  # def index 
  #   @profiles = Profile.all
  #   render :index
  # end 

  def show
    @profile = Profile.find_by(params[:id])
    render :show
  end

  def edit
    @profile = Profile.find_by(params[:id])
  end

  def update
    @profile = Profile.find_by(params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Profile updated"
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find_by(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:name, :sex, :date_of_birth)
  end
end
