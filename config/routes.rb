Rails.application.routes.draw do
  root "departments#index"

  resources :departments do
    get "/employees", to: "employees#professor"
    resources :employees
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
