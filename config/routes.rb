Rails.application.routes.draw do
  resources :commands

  resources :users do
    resources :games do
      resources :instructions
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :statistics

  root 'statistics#index'
end
