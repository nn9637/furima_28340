Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  resources :users, only: [:new, :create, :destroy]
  resources :items do
    resources :item_purchases, only: [:index, :create]
  end
end