# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customers, controller: 'customers/customers', as: 'customers'
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'customers/customers#index'
end
