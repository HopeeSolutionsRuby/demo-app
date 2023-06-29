# frozen_string_literal: true

Rails.application.routes.draw do
  resources :blogs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'blogs#index'
  # get "/blogs/:id", to: "blogs#show", as: :blog_page
  # post "/blogs", to: "blogs#create"
end
