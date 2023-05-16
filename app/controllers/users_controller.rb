class UsersController < ApplicationController
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

  def index
    @users = User.all

    render :index
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      log_in @users
      flash[:success] = "Welcome to the Ecomm App!"
      # redirect_to @users
    else
      render :new
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :phone, :password, :confirm_password)
    end
end
