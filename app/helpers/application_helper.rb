# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def search_form_url
    "/#{controller_path}"
  end

  def search_queries
    case controller_path
    when 'admins/accounts'
      'email_or_phone_cont'
    when 'admins/employers'
      'name_or_website_cont'
    else
      ''
    end
  end
end
