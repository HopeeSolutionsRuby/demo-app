# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/statistics_controller.rb
  class StatisticsController < BaseController
    include Pagy::Backend
    require 'gruff'
    def index
      @g = Gruff::Bar.new
      @g.title = 'Clinic Statistics'
      @g.y_axis_label = 'Numbers of new register'
      @g.x_axis_label = 'Month'
      @g.show_labels_for_bar_values = true
      @g.label_formatting = '%.0f'
      @selected_months = params[:selected_months] || []
      @filtered_customers = filter_customers_by_months
      @signup_data = @filtered_customers.group("MONTH(created_at)").count
      chart_data = []
      standard_labels = { 0 => 'Jan', 1 => 'Feb', 2 => 'Mar', 3 => 'Apr', 4 => 'May', 5 => 'Jun', 6 => 'Jul', 7 => 'Aug', 8 => 'Sep', 9 => 'Oct', 10 => 'Nov', 11 => 'Dec' }
      if @selected_months.empty?
        12.times do |i|
          chart_data << if !@signup_data.keys.include?(i + 1)
                          0
                        else
                          @signup_data[i + 1]
                        end
        end
        @g.labels = standard_labels
      else
        @selected_months.each do |month|
          chart_data << if !@signup_data.keys.include?(month.to_i)
                          0
                        else
                          @signup_data[month.to_i]
                        end
        end
        @g.labels = @selected_months.map { |month| standard_labels[month.to_i - 1] }
      end

      @g.y_axis_increment = chart_data.max / 4
      @g.data('Sign up', chart_data)

      # Render the graph to a temporary file
      tempfile = Tempfile.new(['gruff_graph', '.png'])
      @g.write(tempfile.path)

      # Read the content of the file
      @base64_image = Base64.encode64(File.read(tempfile.path))

      # Close and delete the temporary file
      tempfile.close
      tempfile.unlink
    end

    private

    def filter_customers_by_months
      if @selected_months.present?
        selected_dates = @selected_months.map { |month| Date.new(Date.current.year, month.to_i) }

        # Map each date to its beginning and end of the month
        date_ranges = selected_dates.map do |date|
          (date.beginning_of_month..date.end_of_month)
        end

        puts "===> #{date_ranges}"
        Customer.where(created_at: date_ranges)
      else
        Customer.all
      end
    end
  end
end
