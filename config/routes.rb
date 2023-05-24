Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  get 'carts/index'
  get 'carts/new'
  get 'carts/edit'
  get 'carts/update'
  get 'carts/delete'
  get 'carts/show'
  get 'products/index'
  get 'products/show'
  get 'products/edit'
  get 'products/create'
  get 'products/update'
  get 'products/destroy'
  get 'pass_word_resets/new'
  get 'pass_word_resets/edit'
  get 'sessions/new'
  post '/users/sign_up', to: 'users#sign_up'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root                 'users#index'
end
