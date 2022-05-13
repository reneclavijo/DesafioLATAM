# Leer los archivos de nombres.data y duración.data y convertirlos
# en un Hash

# DATOS DE ENTRADA
peliculas = open('nombres.data').read
duraciones = open('duracion.data').read

peliculas   = peliculas.split("\n")
duraciones  = duraciones.split("\n")

puts peliculas.count
puts duraciones.count

peliculas_hash = peliculas.zip(duraciones).to_h

print peliculas - peliculas_hash.keys
 



# Imprimir en un archivo nuevo desde el hash

archivo_salida = File.open('peliculas.data','a')
peliculas_hash.each do |titulo, duracion|
    archivo_salida.write(titulo + "\t\t" + duracion + "\n")
end
archivo_salida.close
