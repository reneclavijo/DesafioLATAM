Rails.application.routes.draw do
  root 'home#index'  
  devise_for :usuarios
  devise_for :administradores
  resources :productos
  resources :categorias

  resources :carros, only: [:show, :update] do
    member do 
      post  :pagar_con_paypal
      get   :procesar_pago_paypal
    end
  end
end
