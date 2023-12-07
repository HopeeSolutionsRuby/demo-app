# frozen_string_literal: true

Rails.application.routes.draw do
  root 'customers#index'
  resources :customers, only: [:index]
  namespace :administrator do
    root 'dashboard#index'
    devise_for :admins, controllers: {
      sessions: 'administrator/admin/sessions',
      registrations: 'administrator/admin/registrations',
      passwords: 'administrator/admin/passwords'
    }, path: ''
    resources :dashboard, only: [:index]
  end
end
