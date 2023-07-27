# frozen_string_literal: true

module Admins
  class EmployeesController < ApplicationController
    layout 'admin/layout'
    before_action :set_employee, only: %i[edit update destroy show]

    def index
      @q = Employee.includes(:account).ransack(params[:q])
      @pagy, @records = pagy(@q.result(distinct: true))
    end

    def show
      return if @employee

      flash[:error] = "Not found your path with id #{params[:id]}"
      redirect_to admins_employees_path
    end

    def new
      @employee = Employee.new
    end

    def edit
      return if @employee

      flash[:error] = "Not found your path with id #{params[:id]}"
      redirect_to admins_employees_path
    end

    def create
      @employee, error_message = EmployeesManager::EmployeeCreator.call(employee_params)
      if @employee.nil?
        flash[:error] = error_message.split(/[:,]/)[1..]
        redirect_to new_admins_employee_path
      else
        flash[:success] = "Employee with id: #{@employee.id} has been created!"
        redirect_to admins_employees_path

      end
    end

    def update
      if @employee.update(employee_params_update)

        flash[:success] = "Employee with id: #{@employee.id} has been updated!"
        redirect_to admins_employees_path
      else
        flash[:error] = @employee.errors.full_messages
        redirect_to edit_admins_employee_path

      end
    end

    def destroy
      if @employee.destroy
        flash[:success] = "Employee with id: #{@employee.id} has been destroyed!"
        redirect_to admins_employees_path
      else
        flash[:error] = @employee.errors.full_messages
        redirect_to edit_admins_employee_path
      end
    end

    private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :gender, :address, :email, :password, :phone, :avatar)
    end

    def employee_params_update
      params.require(:employee).permit(:first_name, :last_name, :gender, :address, :phone,
                                       account_attributes: %i[email phone avatar])
    end

    def set_employee
      @employee = Employee.find_by(id: params[:id])
    end
  end
end
