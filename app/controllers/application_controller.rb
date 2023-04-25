# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    resource.instance_of?(Admin) ? administrator_root_path : '/'
  end

  def after_sign_out_path_for(scope)
    scope == :admin ? new_admin_session_path : '/'
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
