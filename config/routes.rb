# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customers, only: [:index]
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'customers#index'
end
