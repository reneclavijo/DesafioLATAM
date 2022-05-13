# DATOS DE ENTRADA

alumnos = ["Kandace",    # pos: 0
            "Lindsy",    # pos: 1
            "Boyce",     # pos: 2
            "Rodney",    # pos: 3
            "Malik",     # pos: 4
            "Carli",     # pos: 5
            "Ozzie",     # pos: 6
            "Rodney",    # pos: 7
            "Cecil",     # pos: 8
            "Annie"]     # pos: 9
# pos:    0, 1, 2, 3, 4, 5, 6, 7, 8, 9  
notas =  [9, 3, 2, 1, 6, 4, 5, 10, 4, 8]

# PROCESO 
# nombre: al que vamos a buscar
# alumnos: Arreglo de alumnos en los datos de entrada
# notas: Arreglo de notas de los alumnos registrados
def buscar(nombre, alumnos, notas)
    posicion_alumno = alumnos.index(nombre) # Annie ~> 9
    if posicion_alumno
        notas[posicion_alumno]
    else
        nil
    end
end

nombre_alumno = "Rodney"
nota_de_kandace = buscar(nombre_alumno, alumnos, notas)

# SALIDA
puts "La nota de #{nombre_alumno} es: #{nota_de_kandace}"
