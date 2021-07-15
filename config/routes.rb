Rails.application.routes.draw do
  get "/" => "home#index"
  resources :menu
  resources :customers
  resources :users
  resources :orders
  resources :order_items
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/dashboard" => "dashboard#index"
end
