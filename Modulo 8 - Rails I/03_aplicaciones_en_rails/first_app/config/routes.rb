Rails.application.routes.draw do
  root 'pages#one' # CRUD - Crear | Leer | Actualize | Eliminar
  get 'pages/two'
  get 'pages/three'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
