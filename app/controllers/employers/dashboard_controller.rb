# frozen_string_literal: true

module Employers
  class DashboardController < ApplicationController
    layout 'employer/layout'

    def index
      render 'employers/index'
    end
  end
end
