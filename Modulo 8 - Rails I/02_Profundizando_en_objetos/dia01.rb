# Herencia, Módulo y Mixin

# * La programación Orientada a Objetos tiene 4 propiedades
# ? Encapsulamiento.  Una estrucuta que tiene atributos y métodos en uno solo y oculta información
# ? Abstracción.      Extraer características importantes de objetos y la lógica no deberíamos saber
# ? Herencia.         Definir clases en base a otras para que formen parte de la misma familia
# ? Polimorfismo.     Un objeto se puede comportar como varias clases heredadas

# * En Ruby NO existe la multiherencia, es por eso que tenemos lo siguiente
# Herencia
# Módulo
# Mixin

# Explicación de  * HERENCIA *
class Enemigo
  attr_accessor :vida, :ataque

  def atacar
    jugador.vida -= ataque
  end
end

class Arquero < Enemigo
  attr_accessor :flechas

  def atacar
    # Atacar siempre y cuando existan flechas
  end
end

class Caballero < Enemigo
  attr_accessor :defensa

  def atacar
    # Primero vamos a disminuir la defensa antes que la vida
  end
end

class Lancero < Enemigo
end

class Mago < Enemigo
end

class Ogro < Enemigo
end

class Infanteria < Enemigo
end


# Ejemplo con usuarios

class Usuario

  attr_reader :nombre, :puede_editar

  def initialize(nombre)
    @nombre = nombre
    @puede_editar = false
  end

  def editar
    raise 'No puedo editar'
  end
end

class Administrador < Usuario
  def initialize        # sobre escribiendo un  método
    @puede_editar = true
  end

  def editar
    puts "Editando el blog..."
  end
end

usuario = Usuario.new('reneclavijo')
puts usuario.nombre
puts usuario.puede_editar
usuario.editar

admin = Administrador.new('admin')
puts admin.nombre
puts admin.puede_editar
admin.editar

# Uso de  * super *

class AnimalParlante

  def hablar
    print "Hola, hola, soy un animal "
  end
end

class Perro < AnimalParlante
  def hablar
    puts
    super # ejecutar el código del padre
    puts "y hago guau guau 🐕"
  end
end

class Loro < AnimalParlante

  def hablar
    super
    puts "y quiero galleta 🦜"
    super
    super
  end

  def volar
  end
end
# animal = AnimalParlante.new
# animal.hablar
# perro = Perro.new
# perro.hablar
# loro = Loro.new
# loro.hablar
# loro.volar



class Animal
end

class Mamifero
end

class Leon < Animal

end

class Leon < Mamifero

end




















# Variables de clase @@ y Métodos de clase self

class Pelota
  @@cantidad = 0

  def initialize
    @tipo = ['🎾', '🏀', '🏉', '🏐', '⚽️'].sample
    @@cantidad += 1
  end

  def self.creados
    @@cantidad
  end
end

puts Pelota.creados
pelota = Pelota.new
puts Pelota.creados
