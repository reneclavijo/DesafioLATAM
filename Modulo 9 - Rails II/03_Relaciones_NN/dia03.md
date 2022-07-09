# Desafío Guiado - Cepas

1. Crear el proyecto

    ```bash
    rails new DesafioCepas
    ```

2. Agrear las palabras al config/inflections

    ```ruby
    #cofig/initializers/inflections.rb
    ActiveSupport::Inflector.inflections(:en) do |inflect|
    #   inflect.plural /^(ox)$/i, '\1en'
    #   inflect.singular /^(ox)en/i, '\1'
        inflect.irregular 'cepa', 'cepas'
        inflect.irregular 'ensamblaje', 'ensamblajes'
        inflect.irregular 'vino', 'vinos'
    #   inflect.uncountable %w( fish sheep )
    end
    ```

3. Generar el *scaffold* de Cepas y Vinos

    ```bash
    rails g scaffold Cepa nombre:string
    rails g scaffold Vino nombre:string
    rails db:migrate
    ```

4. Agregar Cepas y Vinos usando el archivo de `db/seeds.rb`

    ```ruby
    # db/seeds.rb
    # Cepas
    Cepa.create(nombre: 'Cabernet Sauvignon')
    Cepa.create(nombre: 'Cabernet')
    Cepa.create(nombre: 'Syrah')
    Cepa.create(nombre: 'Tannat')
    Cepa.create(nombre: 'Malbec')
    Cepa.create(nombre: 'Bonarda')
    Cepa.create(nombre: 'Petit Verdot')
    Cepa.create(nombre: 'Merlot')
    Cepa.create(nombre: 'Carmenere')
    Cepa.create(nombre: 'Sangiovese')
    Cepa.create(nombre: 'Tempranillo')
    Cepa.create(nombre: 'Marselan')
    Cepa.create(nombre: 'Pinot Noir')
    Cepa.create(nombre: 'Carignan')
    Cepa.create(nombre: 'Cinsaunt')
    # Vinos
    Vino.create(nombre: 'Trapiche Broquel')
    Vino.create(nombre: 'Dadá 1 Bonarda')
    Vino.create(nombre: 'Navarro Correas')
    ```

    Luego ejecutamos el comando `rails db:seed`

5. Generar el  modelo de Ensamblaje con las referencias hacia Cepa y Vino

    ```bash
    rails g model Ensamblaje porcentaje:integer vino:references cepa:references
    rails db:migrate
    rails s
    ```

6. Terminar las asosiaciones entre modelos

    ```ruby
    #app/models/cepa.rb
    class Cepa < ApplicationRecord
        has_many :ensamblajes
        has_many :vinos, through: :ensamblajes
    end
    ```

    ```ruby
    #app/models/ensamblaje.rb
    class Ensamblaje < ApplicationRecord
        belongs_to :vino
        belongs_to :cepa
    end
    ```

    ```ruby
    #app/models/vino.rb
    class Vino < ApplicationRecord
        has_many :ensamblajes
        has_many :cepas, through: :ensamblajes
    end
    ```

7. Construir el formulario anidado

    Agregar `accepts_nested_attributes_for` en el modelo del Vino

    ```ruby
    # app/models/vino.rb
    class Vino < ApplicationRecord
        has_many :ensamblajes
        has_many :cepas, through: :ensamblajes
        
        accepts_nested_attributes_for :ensamblajes
    end
    ```

    Modificar el controlador para que permita el paso de los datos anidados y además agregar la lógica de variables para la construcción de las vistas de nuevo y editar

    ```ruby
    # app/controllers/vinos_controller.rb
    class VinosController < ApplicationController
    before_action :set_vino, only: %i[ show edit update destroy ]

    # GET /vinos or /vinos.json
    def index
        @vinos = Vino.all
    end

    # GET /vinos/1 or /vinos/1.json
    def show
    end

    # GET /vinos/new
    def new
        @vino = Vino.new
        @cepas = Cepa.all
        @vino.ensamblajes.build
    end

    # GET /vinos/1/edit
    def edit
        @pos = 0
        if @vino.ensamblajes.count == 0
        @cepas = Cepa.all
        @vino.ensamblajes.build
        end
    end

    # POST /vinos or /vinos.json
    def create
        @vino = Vino.new(vino_params)

        respond_to do |format|
        if @vino.save
            format.html { redirect_to vino_url(@vino), notice: "Vino was successfully created." }
            format.json { render :show, status: :created, location: @vino }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @vino.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /vinos/1 or /vinos/1.json
    def update
        respond_to do |format|
        if @vino.update(vino_params)
            format.html { redirect_to vino_url(@vino), notice: "Vino was successfully updated." }
            format.json { render :show, status: :ok, location: @vino }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @vino.errors, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /vinos/1 or /vinos/1.json
    def destroy
        @vino.destroy

        respond_to do |format|
        format.html { redirect_to vinos_url, notice: "Vino was successfully destroyed." }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_vino
        @vino = Vino.includes(:cepas).find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def vino_params
        params.require(:vino).permit(:nombre, ensamblajes_attributes: [:id, :cepa_id, :porcentaje])
        end
    end
    ```

    Modificar la vista de `app/views/vinos/_form.html.erb` para agregar los atributos anidados

    ```html
    <!-- app/views/vinos/_form.html.erb -->
    <%= form_with(model: vino) do |form| %>
    <% if vino.errors.any? %>
        <div id="error_explanation">
        <h2><%= pluralize(vino.errors.count, "error") %> prohibited this vino from being saved:</h2>

        <ul>
            <% vino.errors.each do |error| %>
            <li><%= error.full_message %></li>
            <% end %>
        </ul>
        </div>
    <% end %>

    <div class="field">
        <%= form.label :nombre %>
        <%= form.text_field :nombre %>
    </div>

    <% if vino.ensamblajes.count != 0 %>
        <div>
        <%= form.fields_for :ensamblajes do |f_ensamblajes| %>
            <%= f_ensamblajes.label vino.ensamblajes[@pos].cepa.nombre %>
            <%= f_ensamblajes.label :porcentaje %>
            <%= f_ensamblajes.number_field :porcentaje %>
            <% @pos += 1 %>
        <% end %>
        </div>
    <% else %>
        <% @cepas.each do |cepa| %>
        <div>
            <%= form.fields_for :ensamblajes do |f_ensamblajes| %>
            <%= f_ensamblajes.label :cepa_id, cepa.nombre %>
            <%= f_ensamblajes.hidden_field :cepa_id, value: cepa.id %>

            <%= f_ensamblajes.label :porcentaje %>
            <%= f_ensamblajes.number_field :porcentaje, value: 0 %>
            <% end %>
        </div>
        <% end %>
    <% end %>

    <div class="actions">
        <%= form.submit %>
    </div>
    <% end %>
    ```

    Finalizar agregar a la vista de  **show** el listado de cepas y sus porcentajes

    ```html
    <p id="notice"><%= notice %></p>

    <p>
    <strong>Nombre:</strong>
    <%= @vino.nombre %>
    </p>

    <% @vino.ensamblajes.each do |e| %>
    <div>
        <%= e.cepa.nombre %>
        <%= e.porcentaje %>
    </div>
    <% end %>

    <%= link_to 'Edit', edit_vino_path(@vino) %> |
    <%= link_to 'Back', vinos_path %>
    ```
