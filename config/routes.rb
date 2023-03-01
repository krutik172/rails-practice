Rails.application.routes.draw do
  get "faculties/index"
  get "students/index"
  get "authors/index"
  get "book/index"
  get "product/index"
  get "rails_introduction/index"

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

  get "/authors", to: "authors#index"
  get "/authors/:id/books", to: "authors#show"
  post "/authors/create", to: "authors#create"
  get "/authors/:id/edit", to: "authors#edit"
  put "/authors/:id/update", to: "authors#update", as: :update_author
  get "/authors/new", to: "authors#new"

  get "/students", to: "students#index"
  get "/students/new", to: "students#new"
  post "/students/create", to: "students#create"

  get "/faculties", to: "faculties#index"
  get "/faculties/new", to: "faculties#new"
  post "/faculties/create", to: "faculties#create"

  get "/employees/show_employee", to: "employees#show_employee"
  get "/employee/index/increase", to: "employees#increase", as: "employee_order_increase"
  get "/employee/index/decrease", to: "employees#decrease", as: "employee_order_decrease"

  get "/items/all", to: "items#show_all", as: "show_all"

  get "/orders/display", to: "orders#display"
  get "/orders", to: "orders#display"
  get "orders/all", to: "orders#index", as: "all_orders"
  resources :employees
  resources :items
  resources :customers
  resources :orders
end
