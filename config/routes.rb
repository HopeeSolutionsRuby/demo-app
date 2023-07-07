# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :accounts

  as :account do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  
  # Defines the root when authenticated or unauthenticated
  Account.roles.each do |role, _|
    authenticated :account, lambda { |account| account.send("#{role}?") } do
      root "#{role.downcase}/dashboard#index".underscore, as: "#{role}_root"
    end
  end

  unauthenticated do
    root to: redirect('/signin')
  end
end
