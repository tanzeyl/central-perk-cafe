Rails.application.routes.draw do
  get "/" => "home#index"
  resources :customers
  resources :users
  resources :orders
  get "/menu" => "menu#index", as: :menu_index
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
