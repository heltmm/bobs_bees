Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  resources :products do
    resources :reviews
  end

  resources :charges

  resources :order_items

  resource :cart, only: [:show]

  root :to => "products#index"
end
