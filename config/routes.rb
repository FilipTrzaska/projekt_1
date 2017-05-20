Rails.application.routes.draw do
  devise_for :users
  resources :pizzas
  root 'pizzas#index'
end
