Rails.application.routes.draw do
  resources :commands
  resources :games
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :statistics

  root 'statistics#index'
end
