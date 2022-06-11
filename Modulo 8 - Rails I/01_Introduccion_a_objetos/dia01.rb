# Programación Orientada a Objetos

#* Clase
class Persona
end

class Llamada
end

class Prestamo
end

class Boleta
  def pagar
    #
  end
end

#* instancia/objeto
persona             = Persona.new #* Instanciar

puts persona.class


# Abstracción
# Es el no aber cómo están 
# desarrolladas las cosas por dentro



# Encapsulación
# Atributos y Métodos para agregar 
class Persona

  def saludar(nombre) # método de instancia
    
    print "Hola #{nombre}!"

  end

end

ignacio = Persona.new
ignacio.saludar("Emerson")
ignacio.saludar("Emerson")








# Atributos | Estados | Características
class Persona

  # El método constructor o initialize en ruby
  def initialize # esto se ejecuta cuando usamos .new
    @estado = :vivo   # Variable de Instancia
    puts "Estoy vivo 🧟‍♂️"
  end

  def saludar(nombre) # método de instancia
    print "Hola #{nombre}!, estoy #{@estado}"
  end

end

# variables de instancia
class Vehiculo
  def encender()
    # texto = "cambiando de estado" # Variables locales, su alcance es solo del método
    # puts texto
    @encendido = :on   # Variable de instancia comienza con @. Están disponibles para toda la clase
  end
  def apagar()
    # puts texto
    @encendido = :off
  end
  def estado()
    @encendido
  end
end

v1 = Vehiculo.new
v1.encender
v1.estado

v2 = Vehiculo.new
v2.apagar
v2.estado

# El método constructor o initialize en ruby
class Persona
  def initialize(nuevo_nombre, nuevo_telefono)
    @nombre = nuevo_nombre
    @telefono = nuevo_telefono
  end

  def obtener_nombre
    @nombre
  end

  def asignar_nombre=(nombre)
    @nombre = nombre
  end

  def obtener_telefono
    @telefono
  end
  def asignar_telefono(telefono)
    @telefono = telefono
  end

  def saludar(nombre) # método de instancia
    "Hola soy #{@nombre}, cómo estas #{nombre}?"
  end

end

# m1 = Mascota.new("Shadow")
# m1.nombre
# Accesores resumidos

class Persona

  attr_accessor :nombre, :telefono, :direccion

  def initialize(nuevo_nombre, nuevo_telefono)
    @nombre = nuevo_nombre
    @telefono = nuevo_telefono
  end

  def saludar(nombre) # método de instancia
    "Hola soy #{@nombre}, cómo estas #{nombre}?"
  end

end

class Mascota
  attr_accessor :nombre   # Crear la variable @nombre y define los métodos de obtener y asignar
  attr_reader :raza       # Crea la variable @raza y define el método obtene_raza
  attr_writer :ultima_consulta # Crea la variable @ultima_consulta y define el método asignar_ultima_consulta
end


class Persona
  
  attr_accessor :nombre

  def initialize(nombre = "anónimo")
    @nombre = nombre
    @edad = 0
  end

  def saludar
    puts "hola #{@nombre}, tengo #{@edad}"
  end

end

p1 = Persona.new("Trinidad")


# require_relative

# cardinalidades
# 0..1
# 1
# 1..n
# 0..n