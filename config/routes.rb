# frozen_string_literal: true

Rails.application.routes.draw do
  root 'customers#index'
  resources :customers, only: [:index]
  namespace :administrator do
    resources :dashboard, only: %i[index]
    resources :customers
  end
end
