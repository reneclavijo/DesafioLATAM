Rails.application.routes.draw do
  resources :reservations
  resources :clients
  resources :categories
  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
