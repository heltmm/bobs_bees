Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :products do
    resources :reviews, only: [:new]
  end

  resources :order_items

  resource :cart, only: [:show]

  root :to => "products#index"
end
