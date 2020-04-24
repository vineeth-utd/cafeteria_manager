Rails.application.routes.draw do
  get "/" => "home#index"

  resources :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  resources :about
  resources :menus
  resources :menu_items
  resources :orders
  resources :order_items
  resources :carts
end
