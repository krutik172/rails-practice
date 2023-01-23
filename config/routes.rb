Rails.application.routes.draw do
  get "product/index"
  get "rails_introduction/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "product#index"
  get "/product", to: "product#index"
  get "/introduction", to: "rails_introduction#index#index"
end
