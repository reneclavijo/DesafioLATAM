# ARREGLOS COMO CONJUNTOS

# Cuando tenemos diferentes arreglos
a = [14, 17, 13, 17, 10, 12, 17, 19, 16, 15]
b = [11, 19, 18, 20, 16, 13, 18, 17, 12, 13]
c = [11, 10, 11, 17, 17, 19, 11, 16, 14, 20]
r = []

# a = a.map{ |x| x.to_s }
# b = b.map{ |x| x.to_s }

# Podemos "unirlos" o concatenarlos
r = a + b + c
puts "con operador +"
print r
puts

# Realizar una diferencia
r = a - b
puts "con operador -"
print r
puts

# Realizar una unión |, les interesa tener un arreglo de valores únicos
r = a | b
puts "con operador |"
print r
puts

# Realizar una intersección
r = a & b
puts "con operador &"
print r
puts
