class SessionsController < ApplicationController
  def new
  end

  def create
    login if params[:commit] == 'Login'
    register if params[:commit] == 'Register'
  end

  def destroy
    log_out
    flash[:success] = ['See you again']
  end

  private

  def login
    user = User.where(email: params[:email]).or(User.where(phone: params[:email])).first
    if user && user.authenticate(params[:password])
      log_in user
      respond_to do |format|
        format.js { render js: "window.location = '#{products_path}'" }
      end
    else
      flash[:error] = ['Invalid email or password']
      render :login
    end
  end

  def register
    user = User.new(register_params)
    if user.save
      flash[:success] = ['Successfully']
      render :new
    else
      flash[:error] = user.errors.full_messages
      render :register
    end
  end

  def login_params
    params.permit(:email, :password)
  end

  def register_params
    params.permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

  def authenticate_password(user, password)
    stored_hash = user.password_digest
    input_hash = Digest::SHA256.hexdigest(password)
    input_hash == stored_hash
  end
end
