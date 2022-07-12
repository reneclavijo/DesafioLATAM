Rails.application.routes.draw do
  devise_for :administradores
  # TODO: Pendiente de implementación
  root 'home#index'

  resources :productos
  resources :categorias
end
