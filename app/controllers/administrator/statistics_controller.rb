# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/statistics_controller.rb
  class StatisticsController < BaseController
    include Pagy::Backend

    def index
      filter_month = params[:filter_month]
      Rails.logger.debug "Params: #{params.inspect}"


      @selected_month = filter_month.present? ? filter_month.split('/') : %w[2023 12]
      Rails.logger.debug "Params: #{@selected_month}"

      return if @selected_month.blank?
      @year, @month = @selected_month.map(&:to_i)

      @month = 1 unless (1..12).include?(@month)
      Rails.logger.debug "Params: #{@month}"

      start_date = Date.new(@year, @month, 1)
      end_date = start_date.end_of_month

      sign_ups_by_day = Customer.where(created_at: start_date..end_date).group("DATE_FORMAT(created_at, '%d/%m')").count
      @sign_ups_by_day = (start_date..end_date).map do |date|
        formatted_key = date.strftime('%d/%m')
        [formatted_key, sign_ups_by_day[formatted_key] || 0]
      end.to_h
        Rails.logger.debug "data: #{@sign_ups_by_day}"


      respond_to do |format|
        format.html
        format.json { render json: @sign_ups_by_day }
      end
    end
  end
end
