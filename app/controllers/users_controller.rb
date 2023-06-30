# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to users_path if @user.blank?
    respond_to do |format|
      format.html
      format.json { render json: @user.posts }
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
    redirect_to users_path if @user.blank?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      flash[:notice] = 'Register successfully !'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_update)
      flash[:notice] = 'Updated successfully !'
      redirect_to users_path
    else
      flash[:alert] = @user.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'Deleted !'
      redirect_to users_path
    else
      flash[:alert] = @user.errors.full_messages
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def user_update
    params.permit(:name, :email)
  end
end
## devise / sorcery
