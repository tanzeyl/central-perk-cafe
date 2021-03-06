Rails.application.routes.draw do
  get "/" => "home#index"
  resources :menu
  resources :customers
  resources :users
  resources :orders
  resources :order_items
  resources :menu_items
  resources :admin_menu
  get "add_toCart/:id" => "menu_items#update"
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/dashboard" => "dashboard#index"
  get "/history" => "orders#history", as: :history
  get "/pendingorders" => "orders#orderupdate"
  post "/change_status/:id" => "orders#change_status"
  get "/singleorder/:id" => "orders#show"
  get "/edit_menu" => "admin_menu#edit_menu"
  get "add_items/:id" => "admin_menu#add_items"
  get "add_cat/:id" => "admin_menu#add_cat"
  get "add_user" => "admin_menu#add_user"
  get "add_admin/:id" => "admin_menu#add_admin"
  get "add_clerk/:id" => "admin_menu#add_clerk"
end
