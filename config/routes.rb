Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: "relationships/kind"

    resource :phones
    resource :phones, path: "relationships/phones"

    resource :address
    resource :address, path: "relationships/address"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
