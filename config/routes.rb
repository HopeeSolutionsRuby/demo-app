# frozen_string_literal: true

Rails.application.routes.draw do
  get 'class_rooms/index'
  get 'teachers/index'
  resources :students
  resources :class_rooms
  root 'welcome#index'
  # resources :posts
  # devise_for :admins, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  # mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Defines the root path route ("/")
  # # root "index#index"

  # namespace :administrator do
  #   # route for administrator
  #   root 'dashboard#index'
  #   resources :admins
  # end
end
