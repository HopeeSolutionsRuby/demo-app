# frozen_string_literal: true

require 'rails_helper'
include AuthHelper

RSpec.describe Administrator::AdminsController, type: :controller do
  # admin with role admin
  let(:admin) { create(:admin, role: 'admin', status: 'active', phone: '1234567890') }
  let(:admin_attributes) { attributes_for(:admin, phone: '1234567890') }

  # admin with role customer_service
  let(:admin_customer_service) { create(:admin, role: 'customer_service', status: 'active', phone: '1234567899') }
  let(:admin_customer_service_attributes) { attributes_for(:admin_customer_service) }

  describe 'GET admins#index' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'renders index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
        before(:each) do
        sign_in admin_customer_service
      end

      it 'renders access_denied layout' do
        get :index
        expect(response).to render_template('layouts/access_denied')
      end
    end
  end

  describe 'GET admins#show' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'renders show template' do
        get :show, params: { id: admin.id }
        expect(response).to render_template(:show)
      end

      it 'returns http success' do
        get :show, params: { id: admin.id }
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end

      it 'renders access_denied layout' do
        get :show, params: { id: admin_customer_service.id }
        expect(response).to render_template('layouts/access_denied')
      end
    end
  end

  describe 'GET admins#new' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'returns http success' do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end

      it 'renders access_denied layout' do
        get :new
        expect(response).to render_template('layouts/access_denied')
      end
    end
  end

  describe 'GET admins#edit' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'returns http success' do
        get :edit, params: { id: admin.id }
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end

      it 'renders access_denied layout' do
        get :edit, params: { id: admin_customer_service.id }
        expect(response).to render_template('layouts/access_denied')
      end
    end
  end

  describe 'DELETE admins#destroy' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'destroys the admin' do
        account = create(:admin, phone: '1234567890')
        expect { delete :destroy, params: { id: account.id } }.to change(Admin, :count).by(-1)
      end

      it 'redirects to the admins#index' do
        delete :destroy, params: { id: admin.id }
        expect(response).to redirect_to(administrator_admins_path)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end
    end
  end

  describe 'POST admins#create' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'creates a new admin' do
        expect { post :create, params: { admin: admin_attributes } }.to change(Admin, :count).by(1)
      end

      it 'redirects to the new admin' do
        post :create, params: { admin: admin_attributes }
        expect(response).to redirect_to(administrator_admins_path)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end
    end
  end

  describe 'PUT admins#update' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'updates the admin' do
        put :update, params: { id: admin.id, admin: { first_name: 'Anh' } }
        admin.reload
        expect(admin.first_name).to eq('Anh')
      end

      it 'redirects to the admin' do
        put :update, params: { id: admin.id, admin: { first_name: 'Anh' } }
        expect(response).to redirect_to(administrator_admin_path(admin))
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end
    end
  end
end