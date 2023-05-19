Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root                 'users#index'
  get    'login'   =>  'sessions#login'
  post   'login'   =>  'sessions#create'
  delete 'logout'  =>  'sessions#destroy'
  get 'users/:id/profiles/edit', to: 'profiles#edit', as: 'profile'
  patch 'users/:id/profiles/edit', to: 'profiles#update', as: 'update_profile'
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy] do
    resource :profiles, only: [:index, :show, :edit, :update]
  end

end
