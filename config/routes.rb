Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources :products

  resources :order_items

  resource :cart, only: [:show]

  root :to => "products#index"
end
