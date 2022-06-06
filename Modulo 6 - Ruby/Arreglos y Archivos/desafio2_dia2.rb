nombres = ['Violeta', 'Andino', 
            'Clemente', 'Javiera', 
            'Paula', 'Pía', 'Ray']

puts "originales".center(20, "-")
print nombres
puts

# 1. Obtener todos los elementos que excedan. los 5 caracteres, utilizando .select.

filtrado = nombres.select do |x|
    x.length > 5
end

puts "filtrados".center(20, "-")
print filtrado
puts

# 2. Utilizar .map para crear un arreglo con
#    todos los nombres en minúscula.

en_minusculas = nombres.map do |x|
    x.downcase
end

puts "en minusculas".center(20, "-")
print en_minusculas
puts

# 3. Utilizar .select para crear un arreglo con todos
# los nombres que empiecen con P

nombre_comienzan_p = nombres.select do |x|
    # x.start_with? "P"
    # x[0] == "P"
    x[0].eql? "P"
end

puts "que comienzan por P".center(20, "-")
print nombre_comienzan_p
puts

# 4. Utilizando .count, contar los elementos
# que empiecen con 'A', 'B' o 'C'

empiezan_con_ABC = nombres.select do |x|
    x.start_with? "A" or x.start_with? "B" or x.start_with? "C"
end

puts "conteo que comienzan por A, B o C:".center(40, "-")
print empiezan_con_ABC.count
puts

# 5. Utilizando .map, crea un arreglo único con  la cantidad de
# letras que tiene cada nombre

conteo_letras = nombres.map do |x|
    x.length
end

puts "letras de los nombres".center(40, "-")
print conteo_letras
puts
