# ENTRADA

datos = ['23.2', '31.1', '321.3', '28.3', '29.4']

# PROCESO
# transformar a float utilizando map
flotantes = datos.map { |x| x.to_f }
promedio = flotantes.sum / flotantes.count

# SALIDA
# mostrar el promedio
puts "El promedio es: #{promedio}"