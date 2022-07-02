# Desafío Guiado - Productora de Eventos

## Descripción
Daniela, encargada del área de eventos de la productora de eventos DL, ha tenido problemas
registrando la cantidad de personas que van a los distintos conciertos de los grupos
musicales que tiene a su cargo, información que es muy importante para poder ver cuánto
alcance tiene realmente cada grupo y poder ver sus proyecciones. Para poder solucionar
esto, Daniela nos ha solicitado realizar un sistema que le permita ingresar los datos
relacionados a los conciertos.
Normalmente las cifras podrían variar una vez terminado el evento, por lo que es necesario
que el sistema permita modificar la cantidad de asistentes a los conciertos después de
haber sido ingresados, y a su vez, poder borrar registros erróneamente inscritos.

**Nota**:
Para realizar el desafío, primero léelo completamente, comprende la solicitud
realizada para crear el sistema.
El desarrollo de este desafío será creado desde cero, por lo cual la información ingresada en
la base de datos será producto de la lógica implementada en Rails.

## Requerimientos

1. Crear la relación entre los modelos (los que puedes llamar Group y Concert).
Recuerda crear FK para relacionarlos. (0,5 Puntos)
Antes de crear los modelos, diagrama la lógica del sistema e identifica las
entidades para cada tabla.

    ```bash
    rails new EventsProduction
    cd EventsProduction
    rails g scaffold Group name:string members:integer debut:date category:integer
    rails g scaffold Concert attendance:integer date:date capacity:integer group:references
    rails db:migrate
    rails s
    ```

    Terminando de relacionar los modelos

    ```ruby
    # app/models/group.rb
    class Group < ApplicationRecord
        has_many :concerts, dependent: :destroy
    end
   ```

   ```ruby
    # app/models/concert.rb
    class Concert < ApplicationRecord
        belongs_to :group
    end
   ```

2. Modificar el CRUD del modelo asociado a los conciertos (Concert) para que en el
formulario pueda hacer la asociación con el modelo asociado a los grupos (Group).
(0,5 Puntos)

    Cambiar text_field de group_id por un select

    ```erb
    <!-- app/views/concerts/_form.html.erb -->
    <div class="field">
        <%= form.label :group_id %>
        <%= form.select :group_id, options_from_collection_for_select(@groups, :id, :name, concert.group_id) %>
    </div>
    ```

    Agregar al controlador, la asignación de @groups para que el formulario lo pueda recuperar.

   ```ruby
   class ConcertsController < ApplicationController
    before_action :set_concert, only: %i[ show edit update destroy ]

    # GET /concerts or /concerts.json
    def index
        @concerts = Concert.all
    end

    # GET /concerts/1 or /concerts/1.json
    def show
    end

    # GET /concerts/new
    def new
        @concert = Concert.new
        asignar_bandas
    end

    # GET /concerts/1/edit
    def edit
        asignar_bandas
    end

    # POST /concerts or /concerts.json
    def create
        @concert = Concert.new(concert_params)

        respond_to do |format|
        if @concert.save
            format.html { redirect_to concert_url(@concert), notice: "Concert was successfully created." }
            format.json { render :show, status: :created, location: @concert }
        else
            asignar_bandas
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @concert.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /concerts/1 or /concerts/1.json
    def update
        respond_to do |format|
        if @concert.update(concert_params)
            format.html { redirect_to concert_url(@concert), notice: "Concert was successfully updated." }
            format.json { render :show, status: :ok, location: @concert }
        else
            asignar_bandas
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @concert.errors, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /concerts/1 or /concerts/1.json
    def destroy
        @concert.destroy

        respond_to do |format|
        format.html { redirect_to concerts_url, notice: "Concert was successfully destroyed." }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_concert
        @concert = Concert.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def concert_params
        params.require(:concert).permit(:attendance, :date, :capacity, :group_id)
        end

        def asignar_bandas
        @groups = Group.all
        end
    end
   ```

3. En el Index de Group desplegar la lista de grupos que existen en la compañía y por
cada uno mostrar la cantidad de conciertos que han tenido a lo largo de su historia
profesional. (1 Punto)
Tip: Recuerda que puedes contar las relaciones de un modelo usando
métodos de instancia.

    Actualizar la tabla de index para agregar una columna donde podamos realizar la siguiente operación

   ```html
   <!-- app/views/groups/index.html.erb -->
    <table>
    <thead>
        <tr>
        <th>Name</th>
        <th>Memebers</th>
        <th>Debut</th>
        <th>Category</th>
        <th>Total Concerts</th>
        <th colspan="3"></th>
        </tr>
    </thead>

    <tbody>
        <% @groups.each do |group| %>
        <tr>
            <td><%= group.name %></td>
            <td><%= group.memebers %></td>
            <td><%= group.debut %></td>
            <td><%= group.category %></td>
            <td><%= group.concerts.count %></td>
            <td><%= link_to 'Show', group %></td>
            <td><%= link_to 'Edit', edit_group_path(group) %></td>
            <td><%= link_to 'Destroy', group, method: :delete, data: { confirm: 'Are you sure?' } %></td>
        </tr>
        <% end %>
    </tbody>
    </table>
   ```

4. Desde la vista Index debo ser capaz de ver la información del grupo (Cantidad de
integrantes, fecha en la que el grupo debutó y si es de hombres, mujeres o una
banda). (1 Punto)
Tip: El uso de enum es una buena práctica.

    Versión rails 7

    ```ruby
    # app/models/group.rb
    class Group < ApplicationRecord
        enum :category, [:hombres, :mujeres, :banda]
        has_many :concerts, dependent: :destroy
    end
    ```

    Versión rails <= 6

    ```ruby
    # app/models/group.rb
    class Group < ApplicationRecord
        enum category: [:hombres, :mujeres, :banda]
        has_many :concerts, dependent: :destroy
    end
    ```

    Cambiar el elemento de number_field por select para seleccionar una categoría para el grupo

   ```erb
   <!-- app/views/groups/_form.html.erb -->
   <div class="field">
    <%= form.label :category %>
    <%= form.select :category, [:hombres, :mujeres, :banda] %>
   </div>
   ```

5. En el index de Group se debe mostrar la cantidad total de personas que han asistido
por concierto de cada grupo. (1 Punto)

6. Si se termina el contrato de algún grupo, entonces se debe eliminar el registro de los
conciertos del mismo. (1 Punto)
Tip: Acción Delete del CRUD

7. En la vista Show de Group debe poder mostrar una tabla con los siguientes datos:

    ● Cuántos conciertos tuvo este mes. (2 Puntos)
        Tip: Investigar Clase Time

    ● Cuándo fue su último concierto con formato de fecha “Año - Mes en palabras-día en palabras”. (1 Punto)
        Tip: Investigar .srtftime() [https://apidock.com/ruby/DateTime/strftime]

    ● Cuál es el número máximo de personas que ha ido a un concierto. (1 Punto)
        Tip: Recuerda evitar el error N+1 Querys

    ● Cuál ha sido el mayor tiempo que ha durado un concierto. (1 Punto)

### Requerimientos Opcionales

Daniela se ha comunicado con nosotros, ha llegado a la decisión de tomar la aplicación
proporcionada, pero espera poder llevar registro de los integrantes del grupo a su vez.

1. Agregar la relación completa entre Group y Crew.

2. Desde la vista New de Group, debo ser capaz de añadir integrantes una vez creado el
grupo.

3. Desde la vista Index de Group, debe poder verse la lista de integrantes que
conforman el grupo.
Tip: Investigar Gema Coocoon para la versión de rails que estés usando
