# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    def index
      @q = Customer.ransack(params[:query])
      @q.sorts = ['age asc', 'full_name asc', 'email asc'] if @q.sorts.empty?

      @q = Customer.ransack(nil) if params[:clear_search]
      @customers = @q.result(distinct: true)
      @pagy, @customers = pagy(@customers, items: 10)
      respond_to do |format|
        format.html
        format.turbo_stream
      end
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:full_name, :age, :sex, :email, :phone, :address, :avatar)
    end
  end
end
