# frozen_string_literal: true

module Employees
  class DashboardController < ApplicationController
    layout 'employee/layout'

    def index
      render 'employees/index'
    end
  end
end
