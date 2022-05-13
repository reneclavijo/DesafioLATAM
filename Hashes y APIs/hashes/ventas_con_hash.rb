# DATOS DE ENTRADA
# Dado un hash con las ventas de los últimos 3 meses:
ventas = { 
    mes1: rand(250..500),
    mes2: rand(250..500),
    mes3: rand(250..500)
}
puts "Ventas/Mes".center(50,"_")
print ventas
puts

# PROCESO
# ● Modificar el hash para incrementar las ventas un 10%. -> Transformar valores con .map
ventas_incrementadas = ventas.map do |clave, valor|
    [clave, (valor *= 1.1).round]
end
#ventas_incrementadas = ventas.map {|clave, valor| [clave, valor + 10] }.to_h

puts "Incremento de ventas 10%".center(50, "_")
print ventas_incrementadas # to_h convertir a Hash
puts

# ● Generar un nuevo hash, pero con las ventas disminuidas un 20%
ventas_disminuidas = ventas.map do |clave, valor|
    # 1. multipliar por 0.8
    # 2. dividir
    porcentaje = valor * 0.2
    [clave, valor -= porcentaje]
end
puts "Ventas disminuidas 20%".center(50, "_")
print ventas_disminuidas
puts
