#! DESAFÍO GUIADO

#* ● Crear un proyecto llamado first_app (1 Punto)
#? consola
# rails new first_app
# rails new first_app --database=posgresql
#* ● Inicializar Git (1 Punto)
#* ● Añadir los cambios y hacer el primer committ (1 Punto)
#? consola
# cd first_app
# git add .
# git commit -m "primer commit"

#* ● Crear el controlador pages con las páginas one y two (2 Puntos)
#? consola
# rails: comando
# g: generar
# controller: elemento que vamos a crear
# pages: el nombre del controlador en PLURAL
# onw two: a las vistas que va a tener el controlador

# rails g controller pages one two

#* ● Asginar la página one como página de inicio (1 Punto)
#? encender el servidor en consola
# rails s
# (OPCIONAL SI SALE ERROR de puerto) rails s -p 3001
# modificar en el archivo config/routes.rb
# root 'pages#one'

#* ● Agregar un título <h1> con tu nombre completo en la página de inicio (0.5 Punto)
# modificar el archivo app/views/pages/one.html.erb
# <h1> su nombre completo </h1>

#* ● Ejecutar el comando rake routes en la terminal y obtener una captura de pantalla del
#* resultado (0.5 Punto)
#? consola
# rails routes
# rake routes
# sacar el screenshot del resultado

#* ● Insertar la imagen de la captura de pantalla obtenida a la página two (1 Punto)
# Arrastrar o copiar la imagen del screenshot en la dirección
# app/assets/images
# abrir el archivo app/views/pages/two.html.erb
# agregar el código en el archivo
# <%= image_tag 'captura_rutas.png' %>

#* ● Añadir los cambios y hacer el segundo commit (0.5 Punto)
# git add . 
# git commit -m "agregando la imagen de las rutas en la vista two"


#* ● Agregar el método three al controlador Pages (1 Punto)
# modificar el archivo app/controllers/pages_controller.rb
# agregar el código
def three
end

#* ● Agregar un archivo llamado three.html.erb a la carpeta views del controlador pages
#* (0.5 Punto)
# crear un archivo en app/views/pages/three.html.erb

#* ● En el archivo config/routes.rb agregar la ruta que apunta al controlador pages con el método
#* three (1 Punto)

get 'pages/three'

#* ● Agregar un título h2 y un párrafo Lorem ipsum en la página three (1 Punto)
# agregar el siguiente código en el archivo app/views/pages/three.html.erb


#* ● Añadir los cambios y hacer el tercer commit (0.5 Punto)
#? consola
# git add . 
# git commit -m "agregando la vista three"

#* ● Agregar un navbar al layout (2 Puntos)
#* ● El navbar debe contener la clase navbar-inverse y su estructura sólo debe contener 3
#* links donde cada uno llevará a la página correspondiente (2 Puntos)
<nav>
  <ul>
    <li> <%= link_to "Primera vista", root_path %> </li>
    <li> <%= link_to "Segunda vista", '/pages/two' %> </li>
    <li> <%= link_to "Tercera vista", '/pages/three' %> </li>
  </ul>
</nav>

#* ● Añadir los cambios y hacer el cuarto commit (1 Punto)
#* ● Crear un repositorio en GitHub (1 Punto)
#* ● Inicializar proyecto en Heroku y hacer push (2 Puntos)