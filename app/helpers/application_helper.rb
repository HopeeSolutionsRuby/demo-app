# frozen_string_literal: true

# application helper
module ApplicationHelper
  def calculate_days_ago(created_at)
    time_ago_in_words(created_at)
  end
end
