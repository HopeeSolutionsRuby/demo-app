class StudentsController < ApplicationController
  before_action :find_student, only: %i[edit update destroy]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find_by(id: params[:id])
    redirect_to students_path if @student.blank?
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end
