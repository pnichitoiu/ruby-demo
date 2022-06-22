Rails.application.routes.draw do
  resources :home
  namespace :admin do
      resources :categories
      resources :products
      resources :users

      root to: "categories#index"
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/categories/:id', to: 'categories#show'
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'application#home'

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users, except: [:new]
  resources :addresses
  delete '/addresses/:id' => 'addresses#destroy'
end
