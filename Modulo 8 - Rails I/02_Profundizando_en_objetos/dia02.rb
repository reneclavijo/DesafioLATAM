# M贸dulos

# Los m贸dulos son geniales para:

# 1. Agrupar constantes.
# 2. Agrupar m茅todos.
# 3. Agrupar clases.
# 4. Evitar colisiones de nombre. 

module ModuloTiempo # CamelCase

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




# Extensi贸n de clases

class Caballero
  def atacar
    "Estoy atacando 馃槨"
  end
end

class Caballero
  def defender
    "estoy defendiendo 馃槴"
  end
end

personaje = Caballero.new
puts personaje.atacar
puts personaje.defender

# Anidando m贸dulos


module Volador
  def volar
    "Vengo desde #{self.class} 馃"
  end
end

# Para incluir los m茅todos de un m贸dulo como m茅todos de clase utilizaremos la instrucci贸n extend.
class Monstruo
  extend Volador
end

puts Monstruo.volar

# Para incluir los m茅todos de un m贸dulo como m茅todos de instancia utilizaremos la instrucci贸n include.
class NPC
  include Volador
end

npc_generico1 = NPC.new
puts npc_generico1.volar

# Analizando la gema de Faker



