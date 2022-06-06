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
ignacio.saludar
ignacio.saludar








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

v2 = Vechiculo.new
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

m1 = Mascota.new("Shadow")
m1.nombre
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

##* Ejercicio: Pedidos desde el mar
# El restaurante El Sabor del Mar, decide que es momento de automatizar sus pedidos para cuál necesita tener pre cargado en un sistema
# sus 5 platos: Ceviche 2000CLP, Sopa de cangrejo 1000CLP, Salmón ahumado 3000CLP, Calamar frito 3000CLP y Arroz mixto 5000CLP
# Cuando se realiza un pedido primero se debe registrar al cliente con su nombre, dirección y teléfono, después de tener estos datos
# es necesario crear el pedido y comenzar a agregar los platos que desee al mismo.
# Los pedidos cuentan con solamente 3 estados: preparando, en_camino y entregado, así que el software debería ser capaz de mostrar esto,
# además de poder calcular el total del pedido y ver el detalle del mismo

##* Ejercicio: Tamagotchi
# Diseñar una mascota virtual que cuente con una vida, la capacidad de "vestir" accesorios como: gorras, lentes o collares, comer y ejercitarse. 
# Para lograr diseñar el juego hay que recordar que la comida afecta directamente a la vida de la mascota, la fruta suma vida y el chocolate le resta, 
# los valores de cada uno deben ser definidos al azar.
# Los juguetes que puede cargar deberán tener un nombre y una descripción antes de asociarlo a una mascota
# La función de ejercitarse que es propia de la mascota, debería sumarle a la vida +5 cada vez que sea llamada.

##* Ejercicios: Chateando
# Para evaluar la funcionaliadad de chat en una aplicación de administración en condominios residenciales, es necesario hacer un prototipo
# donde cada residente que quiera probarlo va a tener que dar su nombre y número de teléfono. Al momento de hacerlo será capaz de enviar
# mensajes a otros residentes. 
# Utilizando clases y objetos, diseñar e implementar dos clases que permitan instanciar residentes, que hablen entre sí y asignarlos a 
# sus casas que se encuentran definidas por letra y número entre la A-C y del 1-5, por ejemplo la cada B4 existe y la casa Z8 no.

##* Ejercicio: Adopción de Mascotas
# Una fundación de animales se encuentra en su edición XIX de adopción y se han dado cuenta que seguir haciéndola de forma manual
# es un proceso muy desgastante. En este proceso se debe conocer a las mascotas que están adoptadas o no junto con sus datos básicos
# como: nombre, raza, numero de vacunas y una observación opcional
# Por el lado de las personas, antes de poder adoptar es necesario registrarlas con un nombre, identificación y teléfono, después de eso
# recien podríamos realizar la acción de adoptar a la mascota. En la aplicación debe quedar relacionado la persona con la mascota
# y una persona puede adoptar muchas mascotas, así que sería bueno que se pudiera imprimir todas las mascotas que la persona ha adoptado 
# tanto en consola como en un archivo .csv

