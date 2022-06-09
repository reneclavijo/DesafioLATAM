# Módulos

# Los módulos son geniales para:

# 1. Agrupar constantes.
# 2. Agrupar métodos.
# 3. Agrupar clases.
# 4. Evitar colisiones de nombre.

module ModuloTiempo

  HORAS_X_DIA = 24

  def self.convertir_horas_dias(cant_horas)
    cant_horas / HORAS_X_DIA
  end

  class HoraLaboral
    def valor_hora_trabajada
      "20$" # texto que representa el valor del ahora trabajada
    end
  end
end

puts ModuloTiempo::HORAS_X_DIA

puts ModuloTiempo.convertir_horas_dias(48)

hora_laboral = ModuloTiempo::HoraLaboral.new
puts hora_laboral.valor_hora_trabajada


# Extensión de clases

class Caballero
  def atacar
    "Estoy atacando 😡"
  end
end

class Caballero
  def defender
    "estoy defendiendo 😫"
  end
end

personaje = Caballero.new
puts personaje.atacar
puts personaje.defender

# Anidando módulos


module Volador
  def volar
    "Vengo desde #{self.class} 🦆"
  end
end

# Para incluir los métodos de un módulo como métodos de clase utilizaremos la instrucción extend.
class Monstruo
  extend Volador
end

puts Monstruo.volar

# Para incluir los métodos de un módulo como métodos de instancia utilizaremos la instrucción include.
class NPC
  include Volador
end

npc_generico1 = NPC.new
puts npc_generico1.volar

# Analizando la gema de Faker



