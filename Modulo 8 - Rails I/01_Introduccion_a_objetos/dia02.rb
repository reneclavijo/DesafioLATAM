# identidad de objetos
class Fruta
  attr_accessor :nombre
end

fruta1 = Fruta.new
fruta1.nombre = "manzana roja 🍎"
fruta2 = Fruta.new
fruta2.nombre = "manzana verde 🍏"

copia = fruta1 # NO estan creando una nueva fruta con los datos. Están creando como un alias para el mismo objeto
copia.nombre = "platano 🍌"


puts "Son iguales" if manzana1 != manzana2
puts manzana1.object_id
puts manzana2.object_id

# valores por defecto en los métodos
# Ejemplo de carrera de caballos
# Preguntas con @variable (estado)
class Caballo
  attr_reader :recorrido  # NO se va a poder cambiar el valor de "recorrido" por fuera de la clase

  def initialize
    @recorrido = 0
  end

  def avanzar(avanzado = 1)
    @recorrido += avanzado
  end
end

relampago_negro = Caballo.new
el_ayudante_de_santa = Caballo.new

# 📚 Ejercicio
# Crear un while para simular la carrera y mostrar al final los recorridos de los caballos

10.times do
  relampago_negro.avanzar(rand(1..10))
  el_ayudante_de_santa.avanzar(rand(1..10))
end

puts "RESULTADOS DE LA CARRERA"
puts "Relámpago negro corrió #{relampago_negro.recorrido}"
puts "El Ayudante de Santa corrió #{el_ayudante_de_santa.recorrido}"




# Manejo de errores raise / begin-rescue
# Listado de errores pre cargado en Ruby 👇🏽👇🏽
# https://ruby-doc.org/core-2.5.1/Exception.html

begin # ¿cuándo usar begin?
  raise 'Soy un error'
rescue
  puts 'pero fui salvado'
end
puts 'y ahora el programa corre de forma normal'

begin
a = 2
b = 3
c = a + b
c = a + b
c = a + b
c = a + b

puts c

d = 3
e = 0

r = d / e

puts "respuesta"

rescue StandardError => e

  puts "esa división no se puede hacer"
  puts e.full_message
end

# Lanzar excepciones 
raise 'No hay mascotas' if true