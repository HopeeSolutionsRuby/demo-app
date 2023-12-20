# frozen_string_literal: true

Ransack.configure do |c|
  # Change default search parameter key name.
  # Default key name is :q
  c.search_key = :query
  c.custom_arrows = {
    up_arrow: '<i class="fa-solid fa-sort" style="font-size: 12px; margin-left: 5px; color: #9299AC;"></i>',
    down_arrow: '<i class="fa-solid fa-sort" style="font-size: 12px; margin-left: 5px; color: #9299AC;"></i>'
  }
end
