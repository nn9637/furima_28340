Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available resources :tweets, only: :indexwithin this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: :index
end