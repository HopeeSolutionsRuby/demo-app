# frozen_string_literal: true

module PaginationHelper
  def total_pages(total_items, per_page)
    (total_items.to_f / per_page).ceil
  end

  def get_displayed_pages(current_page, total_pages, range_per_side = 2)
    return (1..total_pages) unless range_per_side * 2 < total_pages

    start_page = [1, current_page - range_per_side].max
    end_page = [total_pages, current_page + range_per_side].min

    if (end_page - start_page) < (range_per_side * 2)
      start_page = [1, end_page - (range_per_side * 2)].max
      end_page = [1, start_page + (range_per_side * 2)].max
    end

    start_page..end_page
  end
end
