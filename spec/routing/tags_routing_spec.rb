# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator::TagsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/administrator/tags').to route_to('administrator/tags#index')
    end

    it 'routes to #new' do
      expect(get: '/administrator/tags/new').to route_to('administrator/tags#new')
    end

    it 'routes to #show' do
      expect(get: '/administrator/tags/1').to route_to('administrator/tags#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/administrator/tags/1/edit').to route_to('administrator/tags#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/administrator/tags').to route_to('administrator/tags#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/administrator/tags/1').to route_to('administrator/tags#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/administrator/tags/1').to route_to('administrator/tags#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/administrator/tags/1').to route_to('administrator/tags#destroy', id: '1')
    end
  end
end
