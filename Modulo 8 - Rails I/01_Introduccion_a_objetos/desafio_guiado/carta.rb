#? Ejercicio 1
#* ● Crear la clase carta con los atributos numero y pinta. (1 Punto)
#* ● Agregar los getters y setters a ambos atributos.(1 Punto)
#* ● Crear el constructor de la clase carta que le permita recibir un número del 1 al 13 y la
#* pinta que está indicada por una sola letra. Puede ser . (2 Puntos)
#* ● Probar la clase creando un arreglo con 5 cartas.(1 Punto)

class Carta
  attr_accessor :numero, :pinta

  def initialize(numero, pinta)
    # Corazón: 'C', Diamante: 'D', Espada: 'E' o Trébol: 'T'
    @numero = numero
    @pinta = pinta
  end

  def imprimir
    "#{@numero}#{@pinta}"
  end
end

# ● Tip 1: Para escoger un número al azar ocupar Random.rand(rango_inferior, rango_superior).
# ● Tip 2: Agregar las pintas posibles en un arreglo y ocupar el método .sample.

pintas = ['♦️','♠️','♣️','❤️']
cartas = []
5.times do 

  numero = rand(1..13)
  carta_nueva = Carta.new(numero, pintas.sample)
  # cartas << carta_nueva
  cartas.push carta_nueva

end

# Impresión más bonita
cartas.each do |carta|
  print carta.imprimir
  puts
end