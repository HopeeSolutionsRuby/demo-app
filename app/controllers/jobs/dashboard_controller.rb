# frozen_string_literal: true

module Jobs
  class DashboardController < ApplicationController
    layout 'job/layout'

    def index
      render 'jobs/index'
    end
  end
end
