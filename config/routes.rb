# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  
  devise_for :users
  resources :posters
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # HACK: to get around https://github.com/heartcombo/devise/issues/5439
  # get "/", to: "posters#index", as: :user

  # Defines the root path route ("/")
  root 'home#show'
end
