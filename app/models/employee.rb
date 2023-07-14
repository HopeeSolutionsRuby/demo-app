# frozen_string_literal: true

class Employee < ApplicationRecord
  include EmployeeActivities

  belongs_to :account, inverse_of: :employee, dependent: :destroy

  accepts_nested_attributes_for :account, update_only: true

  validates :first_name, :last_name, :address, presence: true
  enum gender: { male: 0, female: 1, another: 2 }

  def self.create_with_account(params)
    employee = nil
    ActiveRecord::Base.transaction do
      # account = Account.create!(email: params[:email], password: params[:password], phone: params[:phone],
      #                           avatar: params[:avatar])
      # employee = Employee.new(first_name: params[:first_name], last_name: params[:last_name], address: params[:address])
      # employee.account = account
      employee = Employee.new(first_name: params[:first_name], last_name: params[:last_name], address: params[:address])
      # Use build_account instead of creating an Account with Account.create! and assign to employee.account.
      employee.build_account(email: params[:email], password: params[:password], phone: params[:phone],
                             avatar: params[:avatar])
      employee.save!
    end

    employee
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.debug e.message
    nil
  end
end
