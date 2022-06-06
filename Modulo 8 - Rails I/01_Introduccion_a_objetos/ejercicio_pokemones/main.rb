require_relative 'pokemon'

local = Pokemon.new
visitante = Pokemon.new


ataque = 0
while visitante.vida > 0 && local.vida > 0

  local.imprimir_datos
  visitante.imprimir_datos
  puts "Seleccionar un ataque 1 o 2"
  ataque = gets.chomp.to_i
  local.atacar(visitante, ataque)

  if visitante.vida > 0
    visitante.atacar(local, rand(1..2))
  end
end

local.imprimir_datos
visitante.imprimir_datos