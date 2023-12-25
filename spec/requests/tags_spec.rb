# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator::TagsController, type: :controller do
  let(:admin) { FactoryBot.create(:admin) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    let(:tags) { FactoryBot.create_list(:tag, 5) }

    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns the requested tag to @tag' do
      get :index
      expect(assigns(:tags)).to match_array(tags)
    end
  end

  describe 'GET #show' do
    let(:tag) { FactoryBot.create(:tag) }

    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { id: tag.id }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { id: tag.id }
      expect(response).to render_template('show')
    end

    it 'assigns the requested tag to @tag' do
      get :show, params: { id: tag.id }
      expect(assigns(:tag)).to eq(tag)
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

    it 'assigns the requested tag to @tag' do
      get :new
      expect(assigns(:tag)).to be_a_new(Tag)
    end
  end

  describe 'GET #edit' do
    let(:tag) { FactoryBot.create(:tag) }

    it 'responds successfully with an HTTP 200 status code' do
      get :edit, params: { id: tag.id }
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      get :edit, params: { id: tag.id }
      expect(response).to render_template('edit')
    end

    it 'assigns the requested tag to @tag' do
      get :edit, params: { id: tag.id }
      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { tag: FactoryBot.attributes_for(:tag) } }

      it 'creates a new tag' do
        expect do
          post :create, params: valid_params
        end.to change(Tag, :count).by(1)
      end

      it 'redirects to the administrator_tags_path after successful creation' do
        post :create, params: valid_params
        expect(response).to redirect_to(administrator_tags_path)
      end

      it 'sets a flash notice after successful creation' do
        post :create, params: valid_params
        expect(flash[:notice]).to eq('Tagging was successfully created.')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { tag: FactoryBot.attributes_for(:tag, name: '') } }

      it 'does not create a new tag with invalid data' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Tag, :count)
      end

      it 'renders the new template after failed creation' do
        post :create, params: invalid_params
        expect(response).to render_template('new')
      end

      it 'sets a flash alert after failed creation' do
        post :create, params: invalid_params
        expect(flash[:alert]).to eq("Cannot create the tagging: Name can't be blank")
      end
    end
  end

  describe 'PATCH #update' do
    let(:tag) { FactoryBot.create(:tag) }

    context 'with valid parameters' do
      it 'updates the tag' do
        patch :update, params: { id: tag.id, tag: FactoryBot.attributes_for(:tag, name: 'Name tag update') }
        tag.reload
        expect(tag.name).to eq('Name tag update')
      end

      it 'redirects to administrator_tags_path after successful update' do
        patch :update, params: { id: tag.id, tag: FactoryBot.attributes_for(:tag, name: 'Name tag update') }
        expect(response).to redirect_to(administrator_tags_path)
      end

      it 'sets a flash notice after successful update' do
        patch :update, params: { id: tag.id, tag: FactoryBot.attributes_for(:tag, name: 'Name tag update') }
        expect(flash[:notice]).to eq('Tagging information updated successfully.')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the tag' do
        patch :update, params: { id: tag.id, tag: FactoryBot.attributes_for(:tag, name: '') }
        tag.reload
        expect(tag.name).not_to eq('')
      end

      it 'renders the edit template after failed update' do
        patch :update, params: { id: tag.id, tag: FactoryBot.attributes_for(:tag, name: '') }
        expect(response).to render_template('edit')
      end

      it 'sets a flash alert after failed update' do
        patch :update, params: { id: tag.id, tag: FactoryBot.attributes_for(:tag, name: '') }
        expect(flash[:alert]).to eq("Cannot update the tagging: Name can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:tag) { FactoryBot.create(:tag) }

    it 'deletes the tag' do
      expect do
        delete :destroy, params: { id: tag.id }
      end.to change(Tag, :count).by(0)
    end

    it 'sets a flash notice after successful deletion' do
      delete :destroy, params: { id: tag.id }
      expect(flash[:notice]).to eq('Tagging has been deleted successfully.')
    end

    it 'redirects to administrator_tags_path after successful deletion' do
      delete :destroy, params: { id: tag.id }
      expect(response).to redirect_to(administrator_tags_path)
    end
  end

  describe '#assign_tag' do
    controller do
      before_action :assign_tag
    end

    context 'when tag exists' do
      let(:tag) { FactoryBot.create(:tag) }

      it 'assigns the tag' do
        get :index, params: { id: tag.id }
        expect(assigns(:tag)).to eq(tag)
      end
    end

    context 'when tag does not exist' do
      it 'sets flash alert and redirects' do
        get :index, params: { id: 'invalid_id' }
        expect(flash[:alert]).to eq('Tag with ID invalid_id not found.')
        expect(response).to redirect_to(administrator_tags_path)
      end
    end
  end
end
