# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :accounts

  as :account do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"
    post "signup" => "devise/registrations#create"
  end
  
  # Defines the root when authenticated or unauthenticated
  Account.roles.each do |role, _|
    authenticated :account, lambda { |account| account.send("#{role}?") } do
      root "#{role.downcase}s/dashboard#index".underscore, as: "#{role}_root"
    end
  end

  namespace :admins do
    resources :accounts
    resources :employees
  end

  unauthenticated do
    root to: redirect('/signin')
  end
end
