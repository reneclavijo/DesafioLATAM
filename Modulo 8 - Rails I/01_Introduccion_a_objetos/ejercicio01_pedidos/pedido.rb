class Pedido # Singular y con CamelCase
  attr_accessor :cliente, :platos, :estado, :total

  def initialize
    @estado = :preparando
    @platos = [] # Estará esperando los platos
  end

  def cambiar_a_en_camino
    @estado = :en_camino
  end

  def cambiar_a_entregado
    @estado = :entregado
  end

  def agregar_plato(nuevo_plato)
    @platos.push nuevo_plato
  end

  def agregar_cliente(cliente)
    @cliente = cliente
  end

  def ver_detalle
    puts "PEDIDO"
    puts "Estado: \t #{@estado}"
    puts "DATOS DEL CLIENTE".center(50, "*")
    puts "Nombre: \t #{@cliente.nombre}"
    puts "Teléfono: \t #{@cliente.telefono}"
    puts "Dirección: \t #{@cliente.direccion}"

    puts "MENU".center(50, "=")
    @platos.each do |p|
      print "#{p.nombre}".ljust(30, ".")
      print "#{p.precio} CLP"
      puts
    end
    puts "TOTAL".center(50, "=")
    puts @total
  end

  def calcular_total
    precios = @platos.map do |plato|
      plato.precio
    end
    @total = precios.sum
  end
end
