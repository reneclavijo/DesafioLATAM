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

7. Crear el formulario
