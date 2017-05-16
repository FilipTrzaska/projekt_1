Rails.application.routes.draw do
  resources :pizzas
  root 'pizzas#index'
end
