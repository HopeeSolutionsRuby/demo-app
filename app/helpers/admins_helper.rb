# frozen_string_literal: true

module AdminsHelper
  def create_index(params_page, index, per_page)
    params_page = 1 if params_page.nil?
    ((params_page.to_i - 1) * per_page.to_i) + index.to_i + 1
  end
end
