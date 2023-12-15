# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    before_action :set_customer, only: %i[show destroy]
    def index
      @customers = Customer.all
    end
    def show; end
    def destroy
      
      @customer.destroy
      flash[:alert] = "Customer has been deleted successfully."
      redirect_to administrator_dashboard_index_path
    end
  
    protected
    def set_customer
      puts "===========#{@customer}============="
      @customer = Customer.find_by(id: params[:id])
     
      unless @customer
        flash[:alert] = "Customer with ID #{params[:id]} not found."
        redirect_to administrator_dashboard_index_path
      end
    end
  end
end
