# frozen_string_literal: true

module Jobcategories
  class DashboardController < ApplicationController
    layout 'Jobcategory/layout'

    def index
      render 'Jobcategories/index'
    end
  end
end
