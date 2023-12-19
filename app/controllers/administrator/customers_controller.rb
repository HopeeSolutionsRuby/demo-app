# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    before_action :set_customer, only: %i[show destroy edit update]

    def index
      @customers = Customer.all
    end

    def show; end

    def edit; end

    def destroy
      @customer.destroy
      flash[:notice] = 'Customer has been deleted successfully.'
      redirect_to administrator_customers_path
    end

    def update
      if @customer.update(customer_params)
        flash[:notice] = 'Customer information updated successfully.'
        redirect_to administrator_customers_path
      else
        flash[:alert] = "Cannot update the customer: #{customer.errors.full_messages.join(', ')}"
        render 'edit'
      end
    end

    private
  
    def set_customer
      @customer = Customer.find_by(id: params[:id])
      unless @customer
        flash[:alert] = "Customer with ID #{params[:id]} not found."
        redirect_to administrator_customers_path
      end
    end

    def customer_params
      params.require(:customer).permit(:full_name, :email, :age, :gender)
    end
  end
end
