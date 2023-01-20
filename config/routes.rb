Rails.application.routes.draw do
  get 'rails_introduction/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "rails_introduction#index"
  get "/introduction", to:"rails_introduction#index#index" 
end
