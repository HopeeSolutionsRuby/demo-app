# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :customers,
             controllers: { sessions: 'customers/sessions', passwords: 'customers/passwords',
                            registrations: 'customers/registrations' }
  root 'customers#index'
  resources :customers, only: %i[index delete]
  namespace :administrator do
    devise_for :admins, controllers: {
      sessions: 'administrator/sessions',
      passwords: 'administrator/passwords'
    }, path: '', skip: [:registrations]
    resources :clinics
    resources :statistics, only: %i[index]
    resources :dashboard, only: [:index]
    resources :customers
    resources :tags
    resources :clinic_imports, only: [:new, :create]
    resources :clinic_exports, only: [:index]
  end
end
