#DATOS DE ENTRADA
# A partir de un hash con un listado de países y la cantidad de usuarios por países.
paises = {
    venezuela:  rand(10..200),
    colombia:   rand(10..200),
    ecuador:    rand(10..100),
    peru:       rand(10..100),
    brasil:     rand(10..500)
}
paises[:bolivia]   = rand(10..500)
paises[:paraguay]  = rand(10..500)
paises[:uruguay]   = rand(10..500)
paises[:chile]     = rand(10..500)
paises[:argentina] = rand(10..500)

puts "USUARIOS * PAISES".center(50, "_")
print paises
puts
# PROCESO
# ● Mostrar sólo los países
puts "Mostrando solo países".center(50, "_")
paises.each do |k, v|
    puts k
end

# ● Mostrar sólo los valores
puts "Mostrando solo la cantidad de usuarios".center(50, "_")
paises.each do |k,v|
    puts v
end

# ● Mostrar sólo los valores mayores a 55 -> con un select por que necesitamos una condición
#                             clave  valor
filtrados = paises.select do |llave, valor|
    valor > 55 # solamente necesita la condición
end
puts "Países con más de 55 usuarios".center(50, "_")
print filtrados
