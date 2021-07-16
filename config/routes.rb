Rails.application.routes.draw do
  get "/" => "home#index"
  resources :menu
  resources :customers
  resources :users
  resources :orders
  resources :order_items
  resources :menu_items
  resources :admin_menu
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/dashboard" => "dashboard#index"
  get "/history" => "orders#history", as: :history
  get "/pendingorders" => "orders#orderupdate"
  post "/change_status/:id" => "orders#change_status"
  get "/singleorder/:id" => "orders#show"
end
