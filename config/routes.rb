Rails.application.routes.draw do
  get 'pass_word_resets/new'
  get 'pass_word_resets/edit'
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root                 'users#index'
  get    'login'   =>  'sessions#login'
  post   'login'   =>  'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get 'users/:id/profiles/edit', to: 'profiles#edit', as: 'profile'
  patch 'users/:id/profiles/edit', to: 'profiles#update', as: 'update_profile'
  get '/pass_word_resets/edit', to: 'password_resets#edit', as: 'edit_password_reset'
  # patch '/pass_word_resets/edit', to: 'password_resets#update', as: 'update_password_reset'
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy] do
    resource :profiles, only: [:index, :show, :edit, :update]
  end
  resources :pass_word_resets, only: [:new, :create, :edit, :update]
end
