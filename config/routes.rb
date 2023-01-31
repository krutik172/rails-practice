Rails.application.routes.draw do
  get "book/index"
  get "product/index"
  get "rails_introduction/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "rails_introduction#index"
  get "/product", to: "product#index"
  get "/product/:id", to: "product#show"
  get "/introduction", to: "rails_introduction#index#index"
  get "/book", to: "book#index"
  get "/book/new", to: "book#new"
  post "/book/create", to: "book#create"
  get "/book/edit/:id", to: "book#edit"
  put "/book/:id/update", to: "book#update", as: :update
  get "/book/:id/delete", to: "book#destroy"
  get "/book/:id", to: "book#show"
end
