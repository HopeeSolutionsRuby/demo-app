# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    # GET /customers
    def index
      @customers = Customer.all
    end
  end
end
