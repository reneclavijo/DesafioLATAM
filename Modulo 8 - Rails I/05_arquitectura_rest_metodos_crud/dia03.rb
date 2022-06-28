#! Desafío guiado - Biblioteca

#* 1. Crear el proyecto
#? consola
# rails new biblioteca
# cd biblioteca

#* 2. Agregar regla de palabra irregular (OPCIONAL)
# config/initializers/inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
    #   inflect.plural /^(ox)$/i, '\1en'
    #   inflect.singular /^(ox)en/i, '\1'
    #   inflect.irregular 'person', 'people'
        inflect.irregular 'libro', 'libros'
    #   inflect.uncountable %w( fish sheep )
end

#* 3. Ejecutar el scaffold para Libro
#? consola
# rails g scaffold Libro titulo:string auto:string estado:integer fecha_prestamo:date fecha_devolucion:date
# rails db:migrate

#* 4. Agregar enum en el modelo y cambiar la vista del index.html.erb
# app/model/libro.rb
class Libro < ApplicationRecord
    enum estado: [:prestado, :en_estante]
end

# app/views/libros/index.html.erb
# <p id="notice"><%= notice %></p>

# <h1>Libros</h1>

# <table>
#   <thead>
#     <tr>
#       <th>Titulo</th>
#       <th>Autor</th>
#       <th>Estado</th>
#       <th>Fecha prestamo</th>
#       <th>Fecha devolucion</th>
#       <th colspan="3"></th>
#     </tr>
#   </thead>

#   <tbody>
#     <% @libros.each do |libro| %>
#       <tr>
#         <td><%= libro.titulo %></td>
#         <td><%= libro.autor %></td>
#         <td><%= libro.estado %></td>
#         <td><%= libro.fecha_prestamo %></td>
#         <td><%= libro.fecha_devolucion %></td>
#         <td><%= link_to 'Show', libro %></td>
#         <td><%= link_to 'Edit', edit_libro_path(libro) %></td>
#         <td><%= link_to 'Destroy', libro, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#       </tr>
#     <% end %>
#   </tbody>
# </table>

# <br>

# <%= link_to 'New Libro', new_libro_path %>

#* 5. Cambiar el parcial del formulario _form.html.erb
# app/views/libros/_form.html.erb
# <div class="field">
# <%= form.label :estado %>
# <%= form.select :estado, [:prestado, :en_estante] %>
# </div>

#* 6 Agregar la gema ransack, modificar el controlador y la vista de index
# Gemfile
gem 'ransack'

# app/controllers/libros_controller.rb
# Modificar el método index
def index
    @q = Libro.ransack(params[:q])
    @libros = @q.result(distinct: true)
  end

# app/views/libros/index.html.erb
# Modificar la cabecera de la tabla en título
# <thead>
#     <tr>
#       <th> <%= sort_link(@q, :titulo) %> </th>
#       <th>Autor</th>
#       <th>Estado</th>
#       <th>Fecha prestamo</th>
#       <th>Fecha devolucion</th>
#       <th colspan="3"></th>
#     </tr>
#   </thead>

#* 7. Agregar el formulario de búsqueda en index.html.erb
# app/views/libros/index.html.erb
# <%= search_form_for @q do |f| %>
#     <%= f.label :estado_cont %>
#     <%= f.select :estado_cont, {"Prestado"=>0, "En estante"=>1} %>
#     <%= f.submit %>
# <% end %>