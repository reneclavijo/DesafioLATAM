# Asociaciones 1 a N utilizando modelos

Para toda la información necesaria según la documentación lo pueden encontrar en el siguiente link

[Guía de Asociaciones Rails](https://guides.rubyonrails.org/association_basics.html)

## Implementarlo en Rails

Vamos a desarollar una aplicación donde una película solamente puede tener 1 categoría, pero una categoría puede pertenecer en varias películas. La relación **1 a N** se vería reflejada de la siguiente manera:

![Imagen 1 a N](../recursos/ref_1_n.png)

Para comenzar a implementarlo en rails debemos tomar en cuenta que al igual que la base de datos, es mucho mejor comenzar a definir las tablas "independientes", lo que significa que son las que no tienen llave foránea en sus columnas. Así que comenzaremos con Categorías que la crearemos en inglés para evitar conflictos de nombres por ahora.

```console
rails g model Category name: string
```
Con *scaffold*
```console
rails g scaffold Category name: string
```

Para relacionarlos más rápido utilizando la línea de consola podemos ejecutar el siguiente código, comando en cuenta que la llave foránea debemos definirla como *references* (sí, con **s** al final) para que el modelo entienda que ya existe uno con ese nombre

```console
rails g model Movie title:string duration:integer category:references
```

Con *scaffold*
```console
rails g scaffold Movie title:string duration:integer category:references
```

## Terminar el nuevo CRUD

1. Ejecutar la migración

    ` rails db:migrate`

2. Agregar las asociaciones a los modelos

    app/models/category.rb
    ```ruby
    class Category < ApplicationRecord
        has_many :movies
    end

    ```

    app/models/movie.rb
    ```ruby
    class Movie < ApplicationRecord
        belongs_to :category
    end
    ```

3. Inspeccionar la vista
   
   3.1. Modificar la vista de index y show (versiones que no sean **7**)

    En el cuerpo de la tabla app/views/movies/index.html.erb
   ```html
    <tbody>
        <% @movies.each do |movie| %>
        <tr>
            <td><%= movie.title %></td>
            <td><%= movie.duration %></td>
            <td><%= movie.category.name %></td>
            <td><%= link_to 'Show', movie %></td>
            <td><%= link_to 'Edit', edit_movie_path(movie) %></td>
            <td><%= link_to 'Destroy', movie, method: :delete, data: { confirm: 'Are you sure?' } %></td>
        </tr>
        <% end %>
    </tbody>  
   ```

   3.2. Modificar el formulario para quitar el text_field y agregar un select

    app/views/movies/_form.html.erb
    ```html
        <%= form_with(model: movie) do |form| %>
        <% if movie.errors.any? %>
            <div id="error_explanation">
            <h2><%= pluralize(movie.errors.count, "error") %> prohibited this movie from being saved:</h2>

            <ul>
                <% movie.errors.each do |error| %>
                <li><%= error.full_message %></li>
                <% end %>
            </ul>
            </div>
        <% end %>

        <div class="field">
            <%= form.label :title %>
            <%= form.text_field :title %>
        </div>

        <div class="field">
            <%= form.label :duration %>
            <%= form.number_field :duration %>
        </div>

        <div class="field">
            <%= form.label :category_id %>
            <%= form.select :category_id, 
            options_from_collection_for_select(
            @categorias, :id, :name
            )
            %>
        </div>

        <div class="actions">
            <%= form.submit %>
        </div>
        <% end %>
    ```

    app/controllers/movies_controller.rb
   ```ruby
    # GET /movies/new
    def new
        @movie = Movie.new
        @categorias = Category.all
    end
   ```

4. Inspeccionar el controlador

    ```ruby
    class MoviesController < ApplicationController
        before_action :set_movie, only: %i[ show edit update destroy ]

        # GET /movies or /movies.json
        def index
            @movies = Movie.all
        end

        # GET /movies/1 or /movies/1.json
        def show
        end

        # GET /movies/new
        def new
            @movie = Movie.new 
            # Don't Repeat Yourself / DRY
            asignar_categorias
        end

        # GET /movies/1/edit
        def edit
            asignar_categorias
        end

        # POST /movies or /movies.json
        def create
            @movie = Movie.new(movie_params)

            respond_to do |format|
            if @movie.save
                format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
                format.json { render :show, status: :created, location: @movie }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @movie.errors, status: :unprocessable_entity }
            end
            end
        end

        # PATCH/PUT /movies/1 or /movies/1.json
        def update
            respond_to do |format|
            if @movie.update(movie_params)
                format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
                format.json { render :show, status: :ok, location: @movie }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @movie.errors, status: :unprocessable_entity }
            end
            end
        end

        # DELETE /movies/1 or /movies/1.json
        def destroy
            @movie.destroy

            respond_to do |format|
            format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
            format.json { head :no_content }
            end
        end

        private
            # Use callbacks to share common setup or constraints between actions.
            def set_movie
            @movie = Movie.find(params[:id])
            end

            # Only allow a list of trusted parameters through.
            def movie_params
            params.require(:movie).permit(:title, :duration, :category_id)
            end

            def asignar_categorias
            @categorias = Category.all
            end
        end
    ```

## Rutas aniadadas

Las rutas anidadas nos ayudan a orgainzar mejor los recursos que dependen de otros, por ejemplo en la página

`https://www.themoviedb.org/movies/{movie_id}/images`

Así que si quisiéramos obtener imágenes de una película, deberíamos tener el ID de la película y agregar /images

Si ponemos otros ejemplos ya en código para aplicaciones de Rails, podríamos llegar a definir rutas haciendo uso de *resources* para definir todas las rutas CRUD pre establecidas

```ruby
Rails.application.routes.draw do
    resources :buildings do
        resources :apartments
    end
end
```

En el caso de desarrollar un Blog y tener un post con diferentes imágenes, videos y comentarios, podría llegar a ser de la siguient manera

```ruby
Rails.application.routes.draw do
    resources :posts do
        resources :images
        resources :videos
        resources :comments
    end
end
```

Si quisiéramos obtener la lista de películas por categorías, tendríamos que hacerlo de la siguiente manera:
```ruby
Rails.application.routes.draw do
    resources :categories do
        resources :movies
    end
end
```


## Borar en cascada

Debemos agregar *dependent: :destroy* en la relación **has_many** que tenga un modelo con otro, esto hará que un recurso elimina los que están relacionados con él en forma de cascada y así evitar el error.

### CUIDADO 🤚🚫

Esto permitirá eliminar muchos registros de una sola vez, así que debemos saber cuándo utilizamos este código

```ruby
class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end
```
