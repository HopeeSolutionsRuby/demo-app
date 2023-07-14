# frozen_string_literal: true

module Admins
  class EmployeesController < ApplicationController
    layout 'admin/layout'
    before_action :set_employee, only: %i[edit update]

    def index
      @employees = Employee.all
      render 'admins/employees/index'
    end

    def new
      @employee = Employee.new
      @account = Account.new
    end

    def edit
      @account = @employee.account
    end

    def create
      @employee = Employee.create_with_account(employee_params)
      # @employee.account = current_account
      respond_to do |format|
        if @employee
          format.html { redirect_to admins_employees_path, notice: 'Employee created successfully!' }
          format.json { render json: @employee, status: :created }
        else
          flash[:notice] = 'invalid'
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      if @employee.update(employee_params_update)
        redirect_to admins_employees_path, notice: 'Employee updated successfully!'
      else
        Rails.logger.debug @employee.errors.full_messages
        Rails.logger.debug @employee.account.errors.full_messages
        flash[:notice] = 'Invalid employee information'
        render :edit
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
      @employee = Employee.find(params[:id])
    end
  end
end
