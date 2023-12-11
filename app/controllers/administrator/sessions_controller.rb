# frozen_string_literal: true

module Administrator
  class SessionsController < Devise::SessionsController
    protected

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || administrator_dashboard_index_path
    end
  end
end
