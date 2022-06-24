Rails.application.routes.draw do
  resources :carta
  # verbo|acción 'URL', to: 'controlador#acccion', as: 'alias'
  get     'juegos',             to: 'juegos#listar',    as: 'juegos'
  get     'juegos/nuevo',       to: 'juegos#nuevo',     as: 'nuevo_juego'
  get     'juegos/:id',         to: 'juegos#mostrar',   as: 'juego'
  get     'juegos/:id/editar',  to: 'juegos#editar',    as: 'editar_juego'
  post    'juegos',             to: 'juegos#crear'
  put     'juegos/:id',         to: 'juegos#actualizar' #Actualizar
  patch   'juegos/:id',         to: 'juegos#actualizar' #Actualizar
  delete  'juegos/:id',         to: 'juegos#eliminar'
end
