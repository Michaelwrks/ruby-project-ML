Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  get "/home", to: "articles#index"
  get "signup", to: "users#new"
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 resources :users, except: [:new]
 resources :sessions, only: [:create]







end
