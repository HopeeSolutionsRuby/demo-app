# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobcategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/jobcategories').to route_to('jobcategories#index')
    end

    it 'routes to #new' do
      expect(get: '/jobcategories/new').to route_to('jobcategories#new')
    end

    it 'routes to #show' do
      expect(get: '/jobcategories/1').to route_to('jobcategories#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/jobcategories/1/edit').to route_to('jobcategories#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/jobcategories').to route_to('jobcategories#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/jobcategories/1').to route_to('jobcategories#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/jobcategories/1').to route_to('jobcategories#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/jobcategories/1').to route_to('jobcategories#destroy', id: '1')
    end
  end
end
