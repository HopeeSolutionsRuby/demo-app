# frozen_string_literal: true

Rails.application.routes.draw do
  root 'customers#index'
  resources :customers, only: [:index]
  resources :administrator
end
