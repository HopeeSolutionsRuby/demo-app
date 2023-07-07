# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    layout 'admin/layout'

    def index
      render 'admin/index'
    end
  end
end
