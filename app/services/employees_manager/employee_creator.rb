# frozen_string_literal: true

module EmployeesManager
  class EmployeeCreator < ApplicationService
    def call
      employee = nil
      ActiveRecord::Base.transaction do
        employee = Employee.new(first_name: @params[:first_name], last_name: @params[:last_name],
                                address: @params[:address])
        # Use build_account instead of creating an Account with Account.create! and assign to employee.account.
        employee.build_account(email: @params[:email], password: @params[:password], phone: @params[:phone],
                               avatar: @params[:avatar])
        employee.save!
      end
      [employee, nil]
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.debug e.message
      [nil, e.message]
    end
  end
end
