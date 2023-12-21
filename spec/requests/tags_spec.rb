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
end
