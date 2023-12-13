# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    def index
      
      @q = Customer.ransack(params[:q])
      @customers = @q.result(distinct: true).order(created_at: :asc)

    end
    def set_customer
      @customer = Customer.find(params[:id])
    end
  
    def customer_params
      params.require(:customer).permit(:full_name, :age, :sex, :email, :phone, :address, :avatar)
    end
    
  end
end
