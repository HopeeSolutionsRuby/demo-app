# frozen_string_literal: true

class Employee < ApplicationRecord
  include EmployeeActivities

  belongs_to :account, inverse_of: :employee, dependent: :destroy

  validates :first_name, presence: true
  enum gender: { male: 0, female: 1, another: 2 }
end
