# frozen_string_literal: true

Rails.application.routes.draw do
<<<<<<< HEAD
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
  end
=======
<<<<<<< HEAD
  root 'customers#index'
  resources :customers, only: [:index]
  resources :administrator
=======
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :administrator do
    resources :dashboard, only: %i[index]
  end
>>>>>>> 5c1b4a1 ([Issue 33]: Fix Reviews)
>>>>>>> 4e61298 ([Issue 33]: Fix Reviews)
end
