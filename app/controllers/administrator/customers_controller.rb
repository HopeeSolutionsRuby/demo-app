# frozen_string_literal: true

module Administrator
  # class Dashboard Controller
  class CustomersController < BaseController
    before_action :assign_customer, only: %i[show destroy edit update]
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

    def show; end

    def edit; end

    def new
      @customer = Customer.new
    end

    def destroy
      @customer.destroy
      flash[:notice] = 'Customer has been deleted successfully.'
      redirect_to administrator_customers_path
    end

    def update
      create_tag(@customer)
      if @customer.update(customer_params.except(:tag_ids))
        flash[:notice] = 'Customer information updated successfully.'
        redirect_to administrator_customers_path
      else
        flash[:alert] = "Cannot update the customer: #{@customer.errors.full_messages.join(', ')}"
        render 'edit'
      end
    end

    def create
      @customer = Customer.new(customer_params.except(:tag_ids))
      create_tag(@customer)

      if @customer.save
        flash[:notice] = "Successfully created a customer named '#{@customer.full_name}'."
        redirect_to administrator_customer_path(@customer)
      else
        flash[:alert] = "Cannot update the customer: #{@customer.errors.full_messages.join(', ')}"
        render 'new'
      end
    end

    private

    def create_tag(customer)
      tag_number = []
      tag_string = []
      tags = params[:customer][:tag_ids].reject(&:empty?)
      tags.each do |value|
        if value.match?(/\A\d+\z/)
          tag_number << Tag.find(value.to_i)
        else
          tag_string << Tag.create(name: value)
        end
      end
      tag_string.each { |value| tag_number << value }
      customer.tags = tag_number
    end

    def assign_customer
      @customer = Customer.find_by(id: params[:id])
      return if @customer

      flash[:alert] = "Customer with ID #{params[:id]} not found."
      redirect_to administrator_customers_path
    end
    def customer_params
      params.require(:customer).permit(:full_name, :email, :age, :gender, :avatar, :password, :password_confirmation,
                                       tag_ids: [])
    end
  end
end
