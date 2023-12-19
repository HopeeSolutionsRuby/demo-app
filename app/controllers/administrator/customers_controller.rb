# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    before_action :assign_customer, only: %i[ show destroy edit update ]

    def index
      @customers = Customer.all
    end

    def show; end

    def edit; end

    def new
      @customer = Customer.new
    end

    def destroy
      @customer.destroy
      flash[:notice] = "Customer has been deleted successfully."
      redirect_to administrator_customers_path
    end

    def update
      if @customer.update(customer_params)
        flash[:notice] = 'Customer information updated successfully.'
        redirect_to administrator_customers_path
      else
        flash[:alert] = "Cannot update the customer: #{@customer.errors.full_messages.join(', ')}"
        render 'edit'
      end
    end
    
    def create
      @customer = Customer.new(customer_params)
      if @customer.save!
        flash[:notice] = "Successfully created a customer named '#{@customer.full_name}'."
        redirect_to administrator_customer_path(@customer)
      else
        flash[:alert] = "Cannot update the customer: #{@customer.errors.full_messages.join(', ')}"
        render 'new'
      end
    end

    private
  
    def assign_customer
      @customer = Customer.find_by(id: params[:id])
      unless @customer
        flash[:alert] = "Customer with ID #{params[:id]} not found."
        redirect_to administrator_customers_path
      end
    end

    def customer_params
      params.require(:customer).permit(:full_name, :email, :age, :gender, :avatar, :password, :password_confirmation)
    end
  end
end
