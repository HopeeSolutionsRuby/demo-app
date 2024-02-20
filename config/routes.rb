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
    resources :dashboard, only: [:index]
    resources :clinic_imports, only: %i[new create]
    resources :clinic_exports, only: [:index]
    resources :statistics, only: %i[index]
    resources :customers, only: %i[index]
  end
end
