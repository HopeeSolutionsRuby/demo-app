# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/statistics_controller.rb
  class StatisticsController < BaseController
    include Pagy::Backend

    def index
      filter_month = params[:filter_month]
      @selected_month = filter_month.present? ? filter_month.split('-') : %w[2023 12]
      return if @selected_month.blank?

      @year, @month = @selected_month.map(&:to_i)
      start_date = Date.new(@year, @month, 1)
      end_date = start_date.end_of_month
      sign_ups_by_day = Customer.where(created_at: start_date..end_date).group('DATE(created_at)').count
      @sign_ups_by_day = (start_date..end_date).map { |date| [date.day, sign_ups_by_day[date] || 0] }.to_h
    end
  end
end
