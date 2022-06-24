#* Definir un CRUD completo
#* Eliminar una registro
# rails 6.x | 5.x
<%= link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' } %>
# rails 7.x
<%= button_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' } %>
#* Strong parameters
    params.require(:juego).permit(:nombre,)
#* Hablar de los partials


#! Scaffold
#? consola
rails g scaffold Carta nombre:string descripcion:string
rails db:migrate



#* 1. Generar el modelo juego
#? consola
rails new juego_cartas
cd juego_cartas
rails g model Juego nombre:string ediciones:string lanzamiento:datetime

#* 2. Realizar la migración a la base de datos
#? consola
rails db:migrate

#* 3. Generar el controlador de juegos para sus vistas
#? consola
rails g controller juegos listar mostrar nuevo editar

#* 4. Finalizar el controlador de juegos_controller con sus métodos del CRUD
# /app/controllers/juegos_controller.rb

class JuegosController < ApplicationController
    # GET /juegos
    def listar
    end
  
    # GET /juegos/:id
    def mostrar
    end
  
    # GET /juegos/nuevo
    def nuevo
    end
  
    # GET /juegos/:id/editar
    def editar
    end
  
    # POST /juegos
    def crear
    end
  
    # PUT|PATCH /juegos/:id
    def actualizar
    end
  
    # DELETE /juegos/:id
    def eliminar
    end
  end
  
  #5. Agregar las rutas completas para el CRUD
  # config/routes.rb
  Rails.application.routes.draw do
    # verbo|acción 'URL', to: 'controlador#acccion', as: 'alias'
    get     'juegos',             to: 'juegos#listar',  as: 'juegos'
    get     'juegos/nuevo',       to: 'juegos#nuevo',   as: 'nuevo_juego'
    get     'juegos/:id',         to: 'juegos#mostar',  as: 'juego'
    get     'juegos/:id/editar',  to: 'juegos#editar',  as: 'editar_juego'
    post    'juegos',             to: 'juegos#crear'
    put     'juegos/:id',         to: 'juegos#actualizar' #Actualizar
    patch   'juegos/:id',         to: 'juegos#actualizar' #Actualizar
    delete  'juegos/:id',         to: 'juegos#eliminar'
  end

#* 6. Agregar la lógica del controlador

#* 7. 