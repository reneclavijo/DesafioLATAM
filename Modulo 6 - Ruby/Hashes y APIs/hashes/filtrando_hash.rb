# DATOS DE ENTRADA
# Dado un hash
ventas = {
    Octubre: 65000,
    Noviembre: 68000,
    Diciembre: 72000
    }

ventas.delete(:Octubre)
# PROCESO

# método filtrar
# param1: hash_de_ventas => recibimos por aquí un Hash
def filtrar(hash_de_ventas)
    filtrado = hash_de_ventas.select do |key, value|
        value < 70000
    end
end


# SALIDA
# Mostrar el nuevo hash filtrado
puts "Ventas filtradas".center(50, "_")
print filtrar(ventas)
puts
