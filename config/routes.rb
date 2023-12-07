# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  root 'customers#index'
  resources :customers, only: [:index]
  namespace :administrator do
    resources :dashboard, only: %i[index]
  end
end
