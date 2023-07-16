# frozen_string_literal: true

module Admins
  class EmployeesController < ApplicationController
    layout 'admin/layout'
    before_action :set_employee, only: %i[edit update destroy show]

    def index
      @url = admins_employees_path
      @queries = 'id_or_first_name_or_last_name_or_address_or_account_email_or_account_phone_cont'
      @q = Employee.includes(:account).ransack(params[:q])
      @employees = @q.result(distinct: true)
      @pagy, @records = pagy(@employees)
    end

    def show
      employees = employee_current_before_after_get
      employee_current_before_after_set(employees)
    end

    def new
      @employee = Employee.new
    end

    def edit; end

    def create
      @employee = Employee.create_with_account(employee_params)
      if @employee
        flash[:success] = ['Employee created successfully!']
        redirect_to admins_employees_path
      else
        flash[:error] = ['Invalid employee information!']
        redirect_to new_admins_employee_path
      end
    end

    def update
      if @employee.update(employee_params_update)
        flash[:success] = ['Employee updated successfully!']
        redirect_to admins_employees_path
      else
        flash[:error] = ['Invalid employee information!']
        redirect_to edit_admins_employee_path
      end
    end

    def destroy
      @employee.destroy
      flash[:success] = ['Employee destroy successfully!']
      redirect_to admins_employees_path
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

    def employee_current_before_after_get
      Employee.includes(:account).where("
        id >= #{params[:id]} - 1").order(:id).limit(3)
    end

    def employee_current_before_after_set(employees)
      id = params[:id].to_i
      idx = employees.index { |e| e.id == id }
      @previous_employee = idx.zero? ? nil : employees[idx - 1]
      @employee = employees[idx]
      @next_employee = idx == employees.size - 1 ? nil : employees[idx + 1]
    end
  end
end
