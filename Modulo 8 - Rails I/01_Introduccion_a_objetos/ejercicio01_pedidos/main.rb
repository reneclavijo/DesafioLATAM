##* Ejercicio: Pedidos desde el mar

# Relacionamos los archivos con el main
require_relative 'cliente' # buscan la dirección del archivo
require_relative 'plato'
require_relative 'pedido'

plato1 = Plato.new('Ceviche',           2000)
plato2 = Plato.new('Sopa de cangrejo',  1000)
plato3 = Plato.new('Salmón ahumado',    3000)
plato4 = Plato.new('Calamar frito',     3000)
plato5 = Plato.new('Arroz mixto',       5000)


# EL PROCESO DEL PEDIDO
# Cuando se realiza un pedido primero se debe registrar al *cliente* con su nombre, dirección y teléfono, después de tener estos datos
# es necesario crear el pedido y *comenzar a agregar los platos que desee al mismo.

cliente1 = Cliente.new
puts "Ingrese el nombre del cliente"
cliente1.nombre = gets.chomp
puts "Ingrese la dirección del cliente"
cliente1.direccion = gets.chomp
puts "Ingrese el teléfono del cliente"
cliente1.telefono = gets.chomp
puts
puts
puts
puts
system("clear")


pedido = Pedido.new
pedido.agregar_cliente(cliente1) # asginado al NPC karla al pedido
# agregando los productos al pedido
plato = ""
while plato != "6"
  puts "MENU".center(50, "*")
  puts "Presione 1 para #{plato1.nombre}"
  puts "Presione 2 para #{plato2.nombre}"
  puts "Presione 3 para #{plato3.nombre}"
  puts "Presione 4 para #{plato4.nombre}"
  puts "Presione 5 para #{plato5.nombre}"
  puts "Presione 6 para CONTINUAR con el PEDIDO"
  plato = gets.chomp
  case plato
  when "1"
    pedido.agregar_plato(plato1)
    puts "#{plato1.nombre} agregado"
  when "2"
    pedido.agregar_plato(plato2)
    puts "#{plato2.nombre} agregado"
  when "3"
    pedido.agregar_plato(plato3)
    puts "#{plato3.nombre} agregado"
  when "4"
    pedido.agregar_plato(plato4)
    puts "#{plato4.nombre} agregado"
  when "5"
    pedido.agregar_plato(plato5)
    puts "#{plato5.nombre} agregado"
  else
    puts "PEDIDO CERRADO"
  end
end

system("clear")
pedido.calcular_total
pedido.ver_detalle

# Cambiar el estado del pedido
pedido.cambiar_a_en_camino
