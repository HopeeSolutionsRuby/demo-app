# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator::CustomersController, type: :controller do
  describe 'GET #index' do
    it 'responds with a 302 status code' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
