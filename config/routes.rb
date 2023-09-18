Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"


 get "signup", to: "users#new"
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 get 'logout', to: 'sessions#destroy', as: :logout
 get 'creative', to: 'creative_artists#new', as: :creative
 post "creative_login", to: "creative_artists#create"
 resources :users, except: [:new]
 resources :creative_artists, only: [:show, :new]
 resources :creative_artists do
  member do
    get 'bio_info' # Adds a route for editing the profile
    patch 'update_profile' # Adds a route for updating the profile
  end
end




end
