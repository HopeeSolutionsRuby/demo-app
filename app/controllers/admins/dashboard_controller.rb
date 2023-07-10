# frozen_string_literal: true

module Admins
  class DashboardController < ApplicationController
    layout 'admin/layout'

    def index
      render 'admins/index'
    end
  end
end
