# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    include Pagy::Backend

    def index
      @q = Customer.ransack(search_params)

      @customers = @q.result(distinct: true)
      @pagy, @customers = pagy(@customers, items: 10)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:full_name, :age, :sex, :email, :phone, :address, :avatar)
    end

    def search_params
      params.fetch(:query, {}).permit!
    end
  end
end
