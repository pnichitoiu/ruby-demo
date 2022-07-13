Rails.application.routes.draw do
  get 'products/show'
  resources :home
  namespace :admin do
      resources :categories
      resources :products
      resources :users

      root to: "categories#index"
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/categories/:id', to: 'categories#show'
  get '/products/:id', to: 'products#show'
  get '/categories', to: 'categories#index'
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#show'

  get "about", to: "home#about"
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users, except: [:new]
  resources :addresses
  delete '/addresses/:id' => 'addresses#destroy'

  get '/password/reset', to: 'password_resets#new'
  post '/password/reset', to: 'password_resets#create'
  get '/password/reset/edit', to: 'password_resets#edit'
  patch '/password/reset/edit', to: 'password_resets#update'

  # process error pages
  #get '/404', to: 'errors#not_found'
  #get '/500', to: 'errors#internal_server'
  #get '/422', to: 'errors#unprocessable'
end
