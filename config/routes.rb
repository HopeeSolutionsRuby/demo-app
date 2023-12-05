# frozen_string_literal: true

Rails.application.routes.draw do
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
<<<<<<< HEAD
>>>>>>> 5c1b4a1 ([Issue 33]: Fix Reviews)
=======
>>>>>>> 968105c ([Issue 33]: Fix Reviews)
end
