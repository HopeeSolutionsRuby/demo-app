# frozen_string_literal: true

# Student controller
class StudentsController < ApplicationController
  before_action :set_student, only: %i[show]

  def index
    @students = Student.all
  end

  def show; end

  private

  def set_student
    @student = Student.find(params[:id])
  end
end
