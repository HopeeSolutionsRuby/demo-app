# frozen_string_literal: true

module EmployeeActivities
  extend ActiveSupport::Concern
  include Capitalizable

  included do
    after_create :send_email_register
    capitalize_attribute :first_name
    capitalize_attribute :last_name

    def self.create_with_account(params)
      employee = nil
      ActiveRecord::Base.transaction do
        employee = Employee.new(first_name: params[:first_name], last_name: params[:last_name],
                                address: params[:address])
        # Use build_account instead of creating an Account with Account.create! and assign to employee.account.
        employee.build_account(email: params[:email], password: params[:password], phone: params[:phone],
                               avatar: params[:avatar])
        employee.save!
      end
      [employee, nil]
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.debug e.message
      [nil, e.message]
    end
  end

  private

  def send_email_register
    # send email
  end
end
