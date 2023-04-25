# frozen_string_literal: true

module Administrator
  class BaseController < ::ApplicationController
    layout 'admin/application'

    before_action :authenticate_admin!
  end
end
