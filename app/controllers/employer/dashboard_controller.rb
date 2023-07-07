# frozen_string_literal: true

module Employer
  class DashboardController < ApplicationController
    layout 'employer/layout'

    def index
      render 'employer/index'
    end
  end
end
