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
      let(:tags) { FactoryBot.create_list(:tag, 2) }
      
      let(:valid_params) do
        tag_ids = tags.map(&:id)
        {
          customer: FactoryBot.attributes_for(:customer, tag_ids: tag_ids)
        }
      end

      it 'creates a new customer' do
        expect do
          post :create, params: valid_params
        end.to change(Customer, :count).by(1)
      end

      it 'redirects to the administrator_customers_path after successful creation' do
        post :create, params: valid_params
        expect(response).to redirect_to(administrator_customer_path(Customer.last))
      end

      it 'sets a flash notice after successful creation' do
        post :create, params: valid_params
        expect(flash[:notice]).to eq("Successfully created a customer named '#{Customer.last.full_name}'.")
      end
    end

    context 'with invalid parameters' do
      let(:tags) { FactoryBot.create_list(:tag, 2) }
      
      let(:invalid_params) do
        tag_ids = tags.map(&:id)
        {
          customer: FactoryBot.attributes_for(:customer, tag_ids: tag_ids, full_name: '')
        }
      end

      it 'does not create a new customer with invalid data' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Customer, :count)
      end

      it 'renders the new template after failed creation' do
        post :create, params: invalid_params
        expect(response).to render_template('new')
      end

      it 'sets a flash alert after failed creation' do
        post :create, params: invalid_params
        expect(flash[:alert]).to eq("Cannot create the customer: Full name can't be blank")
      end
    end
  end

  describe 'PATCH #update' do
    let(:tag_ids) do 
      tags = FactoryBot.create_list(:tag, 2) 
      tags.map(&:id)
    end
        
    let(:customer) { FactoryBot.create(:customer, tag_ids: tag_ids) }

    let(:valid_params) do 
      { 
        id: customer.id, 
        customer: FactoryBot.attributes_for(:customer, tag_ids: tag_ids, full_name: 'Full name customer update') 
      }
    end

    let(:invalid_params) do 
      { 
        id: customer.id, 
        customer: FactoryBot.attributes_for(:customer, tag_ids: tag_ids, full_name: '') 
      }
    end

    context 'with valid parameters' do
      it 'updates the customer' do
        patch :update, params: valid_params
        customer.reload
        expect(customer.full_name).to eq('Full name customer update')
      end

      it 'redirects to administrator_customers_path after successful update' do
        patch :update, params: valid_params
        expect(response).to redirect_to(administrator_customers_path)
      end

      it 'sets a flash notice after successful update' do
        patch :update, params: valid_params
        expect(flash[:notice]).to eq('Customer information updated successfully.')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the customer' do
        patch :update, params: invalid_params
        customer.reload
        expect(customer.full_name).not_to eq('')
      end

      it 'renders the edit template after failed update' do
        patch :update, params: invalid_params
        expect(response).to render_template('edit')
      end

      it 'sets a flash alert after failed update' do
        patch :update, params: invalid_params
        expect(flash[:alert]).to eq("Cannot update the customer: Full name can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:tag_ids) do 
      tags = FactoryBot.create_list(:tag, 2) 
      tags.map(&:id)
    end
        
    let(:customer) { FactoryBot.create(:customer, tag_ids: tag_ids) }

    it 'deletes the customer' do
      expect do
        delete :destroy, params: { id: customer.id }
      end.to change(Customer, :count).by(0)
    end

    it 'sets a flash notice after successful deletion' do
      delete :destroy, params: { id: customer.id }
      expect(flash[:notice]).to eq('Customer has been deleted successfully.')
    end

    it 'redirects to administrator_customers_path after successful deletion' do
      delete :destroy, params: { id: customer.id }
      expect(response).to redirect_to(administrator_customers_path)
    end
  end

  describe '#assign_customer' do
    let(:tag_ids) do 
      tags = FactoryBot.create_list(:tag, 2) 
      tags.map(&:id)
    end
        
    let(:customer) { FactoryBot.create(:customer, tag_ids: tag_ids) }

    controller do
      before_action :assign_customer
    end

    context 'when customer exists' do
      it 'assigns the customer' do
        get :index, params: { id: customer.id }
        expect(assigns(:customer)).to eq(customer)
      end
    end

    context 'when customer does not exist' do
      it 'sets flash alert and redirects' do
        get :index, params: { id: 'invalid_id' }
        expect(flash[:alert]).to eq('Customer with ID invalid_id not found.')
        expect(response).to redirect_to(administrator_customers_path)
      end
    end
  end
end
