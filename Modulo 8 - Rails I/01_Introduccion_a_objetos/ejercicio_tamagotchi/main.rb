##* Ejercicio: Tamagotchi
require_relative 'mascota'
require_relative 'comida'

stich = Mascota.new

comida1 = Comida.new
puts comida1.tipo
puts comida1.valor
puts stich.vida
stich.comer(comida1)


comida2 = Comida.new
puts comida2.tipo
puts comida2.valor
stich.comer(comida2)

puts stich.vida
