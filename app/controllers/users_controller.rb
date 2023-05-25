require 'sessions_helper'

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update]
  attr_accessor :remember_token, :activation_token, :reset_token

  # CRUD create read update delete
  # def index
  #   list
  #   GET /tasks    Task[]  Get a list of tasks
  # end

  # def show
  #   get detail
  #   GET /tasks/{taskId}   Task  Get a task by ID
  # end

  # def new
  #   render form new
  # end

  # def create
  #   create user
  #   POST  /tasks  Task  Task  Create a new task
  # end

  # def edit
  #   render form edit
  # end

  # def update
  #   Update
  #   PUT /tasks/{taskId} Task  Task  Update a task
  #   Patch /tasks/{taskId} Task  Task  Update a task
  # end

  # def destroy
  #   delete User
  #   Delete  /tasks/{taskId}   Task  Delete a task
  # end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def index
    @users = User.all

    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
   end 

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      log_in @users
      flash[:success] = "Welcome to the Ecomm App!"
      redirect_to @users
    else
      render :new
    end
  end

  def edit
    @users = User.find(params[:id])
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Acount updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :phone, :password, :confirm_password)
  end

  def user_profile_params
    params.require(:profile).permit(:date_of_birth, :address, :sex)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
end
