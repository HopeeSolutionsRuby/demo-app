# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def search_form_url
    "/#{controller_path}"
  end

  def search_form_queries
    case controller_path
    when 'admins/accounts'
      'email_or_phone_cont'
    when 'admins/employees'
      'id_or_first_name_or_last_name_or_address_or_account_email_or_account_phone_cont'
    end
  end
end
