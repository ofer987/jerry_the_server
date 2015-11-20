Rails.application.routes.draw do
  resources :statistics

  root 'statistics#index'
end
