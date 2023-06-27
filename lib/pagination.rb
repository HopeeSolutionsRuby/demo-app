module Pagination
  def page(number, per_page)
    (total_items.to_f / per_page).ceil
  end
end
