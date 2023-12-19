# frozen_string_literal: true

Ransack.configure do |c|
  # Change default search parameter key name.
  # Default key name is :q
  c.search_key = :query
  c.custom_arrows = {
    up_arrow: '<i class="fa-solid fa-sort-up"></i>',
    down_arrow: '<i class="fa-solid fa-sort-up fa-rotate-180"></i>',
    default_arrow: '<i class="fa-solid fa-sort fa-xs"></i>'
  }
end
