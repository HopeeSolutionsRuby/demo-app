# frozen_string_literal: true

module Jobtags
  class DashboardController < ApplicationController
    layout 'job_tag/layout'

    def index
      render 'job-tags/index'
    end
  end
end
