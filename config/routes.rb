Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # resources :auths, only: [:create]
  
  api_version(module: "V1", header: { name: "X-Version", value: "1.0" }) do
  # api_version(module: "V1", header: { name: "Accept", value: "application/vnd.api+json; version=1" }) do
    resources :kinds
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: "relationships/kind"

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: "relationships/phones"

      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: "relationships/phones"

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: "relationships/address"
    end
  end

  api_version(module: "V2", header: { name: "X-Version", value: "2.0" }) do
    # api_version(module: "V2", header: { name: "Accept", value: "application/vnd.api+json; version=2" }) do
    resources :kinds
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: "relationships/kind"

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: "relationships/phones"

      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: "relationships/phones"

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: "relationships/address"
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
