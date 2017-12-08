Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  resources :products do
    resources :reviews
  end
  resource :home, :index

  resources :charges, :only => [:new, :create]

  resources :order_items

  resources :addresses, :only => [:create]

  resource :cart, only: [:show]

  root :to => "products#home"

  get "cart/selectaddress", to: "carts#selectaddress"
  post "cart/processaddress", to: "carts#processaddress"


  get "*path", to: redirect('/')
end
