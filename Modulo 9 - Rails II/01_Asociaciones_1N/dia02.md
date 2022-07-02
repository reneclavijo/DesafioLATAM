# Consultas avanzadas con asociaciones y rutas anidadas

## Consultas

1. Agregar 10 categorías
2. LLenar hasta 15 películas
3. Consultas avanzadas con modelos

    ```ruby
    Movie.all                       # select * from movies;
    Movie.find(5)                   # Busca si o si por el id | SELECT "movies".* FROM "movies" WHERE "movies"."id" = ?
    Movie.find_by(columna: valor)   # Busca por columna | SELECT "movies".* FROM "movies" WHERE "movies"."duration" = ?
    Movie.select(:id, :title)       # SELECT id, title FROM movies;
    Movie.pluck(:title)             # Devuelve un arreglo con los valores solicitados
    ```

## Migraciones

4. Agregar un link para almacenar el poster de la película y modificar todo el CRUD para que el cambio se vea reflejado

```bash
rails g migration AgregarPosterAPelicula
```

```ruby
# db/migrate/xxxxxxxx_agregar_poster_a_pelicula.rb
class AgregarPosterAPelicula < ActiveRecord::Migration[6.1]
  def change
    #add_column(:nombre_tabla, nombre_columna, :tipo_dato)
    add_column(:movies, :poster, :string)
  end
end

```

Ejecutar la migración en consola
```bash
rails db:migrate
```

Agregar el nuevo campo de poster en el formulario de movies
```erb
<!-- app/views/movies/_form.html.erb -->
<div class="field">
    <%= form.label :poster %>
    <%= form.text_field :poster %>
</div>
```

Para poder ver el poster debemos modificar el archivo app/views/movies/show.html.erb (Rails <= 6) y app/views/movies/_movie.html.erb (Rails >= 7)

```erb
<!-- Imagen -->
<div>
  <img src="<%= @movie.poster %>" >
</div>

```

## Problema N+1

Para solucionar el problema N+1 es necesario evitar la consulta intensa a la base de datos utilizando el método *.includes(:relación)* con el modelo necesario

Para esto vamos a agregar en nuestro app/controllers/movies_controller.rb en el método **index** el siguiente código

```ruby
  def index
    # esto soluciona el problema N+1 👇 en vez de Movie.all
    @movies = Movie.includes(:category)
  end
```

## Rutas anidadas

5. Agregar una tabla nueva que almacenemos los comentarios / reviews de las películas

Generar la nueva tabla Reviews que está relacionada con Movies

En consola
```bash
rails g scaffold Review content:string movie:references
rails db:migrate

```

Agregar la asociación entre los modelos de Movie y Review
app/models/movie.rb
```ruby
class Movie < ApplicationRecord
  belongs_to    :category # singular
  has_many      :reviews
end
```

config/routes.rb
```ruby
  resources :movies do
    resources :reviews    
  end
```