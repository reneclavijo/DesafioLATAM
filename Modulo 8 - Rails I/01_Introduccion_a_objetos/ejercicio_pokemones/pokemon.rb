require 'faker' # Faker es una gema que genera datos aleatorios

class Pokemon
  attr_reader :nombre, :vida, :ataque1, :ataque2

  def initialize
    @nombre = Faker::Games::Pokemon.name
    @vida = rand(50..100)
    @ataque1 = rand(10..50)
    @ataque2 = rand(10..50)
  end

  def imprimir_datos
    puts "👾 #{@nombre} \t 🔋 #{@vida} \t ⚔️ #{@ataque1} \t ⚔️ #{@ataque2}"
  end

  def recibir_daño(valor)
    @vida -= valor
    if @vida < 0
      @vida = 0
    end
  end

  def atacar(contrincante, ataque)
    case ataque
    when 1
      contrincante.recibir_daño @ataque1
    when 2
      contrincante.recibir_daño @ataque2
    end
  end

end
