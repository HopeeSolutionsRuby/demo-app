# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :find_student, only: %i[edit update destroy]
  include Pagy::Backend
  def index
    @q = Student.ransack(params[:q])
    @students = @q.result(distinct: true)
    @pagy, @students = pagy(@students, items: 10)
  end

  def show
    @student = Student.find_by(id: params[:id])
    redirect_to students_path if @student.blank?
  end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Created successfully!!'
      redirect_to students_path
    else
      flash[:errors] = 'Invalid infomation to create'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      flash[:notice] = 'Updated successfully!!'
      redirect_to students_path
    else
      flash[:errors] = 'Invalid infomation to update'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = 'Delete successfully!!'
      redirect_to students_path
    else
      flash[:errors] = 'Invalid infomation to update'
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :age, :address, :city, :province, :class_room_id)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
