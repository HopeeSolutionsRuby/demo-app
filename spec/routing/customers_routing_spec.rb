# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator::CustomersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/administrator/customers').to route_to('administrator/customers#index')
    end

    it 'routes to #new' do
      expect(get: '/administrator/customers/new').to route_to('administrator/customers#new')
    end

    it 'routes to #show' do
      expect(get: '/administrator/customers/1').to route_to('administrator/customers#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/administrator/customers/1/edit').to route_to('administrator/customers#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/administrator/customers').to route_to('administrator/customers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/administrator/customers/1').to route_to('administrator/customers#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/administrator/customers/1').to route_to('administrator/customers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/administrator/customers/1').to route_to('administrator/customers#destroy', id: '1')
    end
  end
end
