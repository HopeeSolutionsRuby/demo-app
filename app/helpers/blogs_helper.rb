# frozen_string_literal: true

# Helper module
module BlogsHelper
  def format_date(date)
    date.strftime('%B %d, %Y')
  end
end
