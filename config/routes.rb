Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"


 get "signup", to: "users#new"
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 get 'logout', to: 'sessions#destroy', as: :logout
 resources :users, except: [:new]
 resources :creative_artists, only: [:show, :new]

 get 'creative_signup', to: 'creative_artists#new'
 post 'creative_signup', to: 'creative_artists#create'

 get 'creative_profile/:id/edit', to: 'creative_sessions#edit', as: :edit_creative_profile
 patch 'creative_profile/:id/edit', to: 'creative_sessions#update', as: :update_creative_profile





end
