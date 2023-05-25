Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: {password: 'secret', confirmation: 'verification', 
    unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  get 'products/index'
  get 'products/show'
  get 'products/edit'
  get 'products/create'
  get 'products/update'
  get 'products/destroy'
  get 'pass_word_resets/new'
  get 'pass_word_resets/edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  delete 'logout'  => 'sessions#destroy'
  get 'users/:id/profiles/edit', to: 'profiles#edit', as: 'profile'
  patch 'users/:id/profiles/edit', to: 'profiles#update', as: 'update_profile'
  get '/pass_word_resets/edit', to: 'password_resets#edit', as: 'edit_password_reset'
  # patch '/pass_word_resets/edit', to: 'password_resets#update', as: 'update_password_reset'
  post '/pass_word_resets/new', to: 'pass_word_resets#create'
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy] do
    resource :profiles, only: [:index, :show, :edit, :update]
  end
  resources :pass_word_resets, only: [:new, :create, :edit, :update]
  resources :products
end