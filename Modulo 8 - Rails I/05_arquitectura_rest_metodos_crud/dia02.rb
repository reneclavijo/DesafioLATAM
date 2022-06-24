# Gemas Kaminari & Ransack

# API
# Desafío guiado

#* 1. Crear el proyecto, generar el scaffold para Movie y realizar la migración
#? consola
# rails new blockbuster
# cd blockbuster
# rails g scaffold Movie title:string duration:integer category:string
# rails db:migrate
#! seed -> Un archivo semilla que permite agregar registros iniciales en la BD
# 2. Agregar la gema de faker en el Gemfile
# agregar al final del Gemfile la gema 
gem 'faker'
#? consola
# bundle

# 3. Utilizar en el archivo de db/seeds.rb para agregar 1000 películas
# agregar en db/seeds.rb
categorias = [
    "acción",
    "aventura",
    "terror",
    "comedia",
    "ciencia ficción",
    "suspenso",
    "documental",
    "independiente"
]

1000.times do
    Movie.create(
        title: Faker::Movie.title,
        duration: rand(60..120),
        category: categorias.sample
    )
end
# 4. Ejecutar el comando para leer la semilla
#? consola
# rails db:seed
# rails s

#! Gema Kaminari
# 5. Agregar la gema al Gemfile y ejecutar bundle
# agregar al final del Gemfile
gem 'kaminari'
#? consola
# bundle

# 6. Probar el método .page()
# modificar app/controllers/movies_controller.rb
# GET /movies or /movies.json
def index
@movies = Movie.page(params[:page])
end
# Agregar al final la "miga de pan" visual en app/views/movies/index.html.erb
# <%= paginate(@movies) %>

#! Gema Ransack búsquedas con ERB
# 7. Agregar la gema al Gemfile y ejecutar bundle
# agregar al final del Gemfile
gem 'ransack'
#? consola
# bundle

# 8. Modificar el controlador
# Agregar a app/controllers/movies_controller.rb


