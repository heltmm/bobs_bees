Rails.application.routes.draw do
  resources :products

  resources :order_items

  root :to => "products#index"
end
