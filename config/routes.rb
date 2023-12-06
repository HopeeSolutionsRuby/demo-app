# frozen_string_literal: true

Rails.application.routes.draw do
  resources :customers, only: [:index]
  root 'customers#index'
end
