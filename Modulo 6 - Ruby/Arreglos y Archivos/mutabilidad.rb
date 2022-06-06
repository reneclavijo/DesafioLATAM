peliculas = ["There Will Be Blood",
            "Eternal Sunshine of the Spotless Mind",
            "Oldeuboi",
            "The Dark Knight",
            "Eternal Sunshine of the Spotless Mind",
            "Sholay",
            "Batman Begins",
            "Stand by Me",
            "Prisoners",
            "Sunrise: A Song of Two Humans"]

copia = peliculas
# Cambiar un valor de la COPIA 🚨
peliculas[0] = "Sin Filtro"
copia[0] = "Transformers 50"

# métodos de impresión
puts "originales".center(50, "-")
print peliculas
puts
puts "copias".center(50, "*")
print copia
puts

# nombre = "rene r. clavijo"

# letra = nombre[0]
# puts "primera letra es #{letra}"
# nombre[0] = "R"
# puts "el nombre es #{nombre}"
# copia = nombre
# puts "la copia es #{copia}"
# copia[3] = "é"
# puts "el original es #{nombre}"
# puts "la copia es #{copia}"
