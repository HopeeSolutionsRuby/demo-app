# frozen_string_literal: true

module Administrator
  # SessionsController
  class SessionsController < Devise::SessionsController
    protected

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || administrator_dashboard_index_path
    end

    def after_sign_out_path_for(_resource_or_scope)
      new_administrator_admin_session_path
    end
  end
end
