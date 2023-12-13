# frozen_string_literal: true

Rails.application.routes.draw do
  root 'customers#index'
  resources :customers, only: [:index]
  namespace :administrator do
    devise_for :admins, controllers: {
      sessions: 'administrator/sessions',
      passwords: 'administrator/passwords'
    }, path: '', skip: [:registrations]
    resources :dashboard
  end
end
