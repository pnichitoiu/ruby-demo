Rails.application.routes.draw do
  namespace :admin do
      resources :categories
      resources :products

      root to: "categories#index"
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/categories/:id', to: 'categories#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
