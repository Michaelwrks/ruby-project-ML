Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"


 get "signup", to: "users#new"
 get "login", to: "sessions#new"
 get "logged_in", to: "sessions#new"
 post "login", to: "sessions#create"
#  post "login", to: "sessions#create"
 get 'logout', to: 'sessions#destroy', as: :logout
 resources :users, except: [:new]
#  resources :sessions, except: [:new]


end
