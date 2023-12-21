# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator::TagsController, type: :request do
  describe 'GET #index' do
    it 'responds with a 302 status code' do
      get administrator_tags_path
      expect(response).to have_http_status(302)
    end
  end 
end
