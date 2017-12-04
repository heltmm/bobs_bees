Rails.application.routes.draw do
  resources :products

  resources :order_items

  resource :cart, only: [:show]

  root :to => "products#index"
end
