# frozen_string_literal: true

module Employee
  class DashboardController < ApplicationController
    layout 'employee/layout'

    def index
      render 'employee/index'
    end
  end
end
