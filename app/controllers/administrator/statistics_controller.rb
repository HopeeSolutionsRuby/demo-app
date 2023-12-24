# frozen_string_literal: true

module Administrator
  class StatisticsController < BaseController
    include Pagy::Backend

    def index
      filter_month = params[:filter_month]

      @selected_month = filter_month.present? ? filter_month.split('/') : %w[2023 1]
      return if @selected_month.blank?

      @year, @month = @selected_month.map(&:to_i)
      @month = 1 unless (1..12).include?(@month)

      start_date = Date.new(@year, @month, 1)
      end_date = start_date.end_of_month

      sign_ups_by_day = Customer.where(created_at: start_date..end_date).group("DATE_FORMAT(created_at, '%d/%m')").count
      @sign_ups_by_day = generate_sign_up_data(start_date, end_date, sign_ups_by_day)

      respond_to do |format|
        format.html
        format.json { render json: @sign_ups_by_day }
      end
    end

    private

    def generate_sign_up_data(start_date, end_date, sign_ups_by_day)
      (start_date..end_date).map do |date|
        formatted_key = date.strftime('%d/%m')
        [formatted_key, sign_ups_by_day[formatted_key] || 0]
      end.to_h
    end
  end
end
