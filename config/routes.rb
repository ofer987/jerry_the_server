Rails.application.routes.draw do
  get 'test/move'

  resources :commands

  resources :users do
    get 'active_game/index'

    resources :games do
      resources :instructions

      get 'active_game/activate'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :statistics

  root 'statistics#index'
end
