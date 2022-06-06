# Lectura

datos = open("estudiantes.data").read
print datos
puts datos.class

# Escritura

a = [1,2,5,6,6,7,8,98]
salida = File.open('resultado.data', 'w')
a.each do |x|
    salida.write(x.to_s + "\n")
end
salida.close
