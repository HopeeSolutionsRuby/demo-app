# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator::CustomersController, type: :controller do
  let(:admin) { FactoryBot.create(:admin) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    let(:customers) { FactoryBot.create_list(:customer, 5) }

    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns the requested customer to @customer' do
      get :index
      expect(assigns(:customers)).to match_array(customers)
    end
  end

  describe 'GET #show' do
    let(:customer) { FactoryBot.create(:customer) }

    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { id: customer.id }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { id: customer.id }
      expect(response).to render_template('show')
    end

    it 'assigns the requested customer to @customer' do
      get :show, params: { id: customer.id }
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new  
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns the requested customer to @customer' do
      get :new
      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe 'GET #edit' do
    let(:customer) { FactoryBot.create(:customer) }

    it 'responds successfully with an HTTP 200 status code' do
      get :edit, params: { id: customer.id }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      get :edit, params: { id: customer.id }
      expect(response).to render_template('edit')
    end

    it 'assigns the requested customer to @customer' do
      get :edit, params: { id: customer.id }
      expect(assigns(:customer)).to eq(customer)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do

      # tags = params.dig(:customer, :tag_ids)&.reject(&:empty?) || []

      let(:tags) { FactoryBot.create_list(:tag, 2) }
      tag_ids = tags.map(&:id)

      valid_params = {
        customer: FactoryBot.attributes_for(:customer, tag_ids: tag_ids)
      }

      it 'creates a new customer with valid parameters' do

        
  
        post :create, params: valid_params
        expect(response).to have_http_status(:success)
      end

      # let(:tags) { FactoryBot.create_list(:tag, 2) }

      # let(:valid_params) do
      #   {        
      #     customer: FactoryBot.attributes_for(:customer), 
      #     customer_tags: tags.map { |tag| { name: tag.name } }
      #   } 
      # end

      it 'creates a new customer' do
        expect do
          post :create, params: valid_params
        end.to change(Customer, :count).by(1)
      end

      # it 'redirects to the administrator_customers_path after successful creation' do
      #   post :create, params: valid_params
      #   expect(response).to redirect_to(administrator_customers_path)
      # end

      # it 'sets a flash notice after successful creation' do
      #   post :create, params: valid_params
      #   expect(flash[:notice]).to eq('Customer was successfully created.')
      # end
    end

    # context 'with invalid parameters' do
    #   let(:invalid_params) { { customer: FactoryBot.attributes_for(:customer, name: '') } }

    #   it 'does not create a new customer with invalid data' do
    #     expect do
    #       post :create, params: invalid_params
    #     end.not_to change(Customer, :count)
    #   end

    #   it 'renders the new template after failed creation' do
    #     post :create, params: invalid_params
    #     expect(response).to render_template('new')
    #   end

    #   it 'sets a flash alert after failed creation' do
    #     post :create, params: invalid_params
    #     expect(flash[:alert]).to eq("Cannot create the customer: Name can't be blank")
    #   end
    # end
  end
end
