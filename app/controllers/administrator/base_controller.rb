# frozen_string_literal: true

module Administrator
  # Class BaseController
  class BaseController < ApplicationController
    before_action :authenticate_administrator_admin!
    layout 'admin'
    include Pagy::Backend
  end
end
