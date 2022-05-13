
# Hay que recuperar la dependencia de ruby csv ⚠
require 'csv'

# LEER un archivo CSV 📒

datos = CSV.open('email.csv').read # devuelve un Array

# datos.each do |fila|
#     fila[0].split(';').each do |columna|
#         print "| #{columna.ljust(20)} | " # mostrando el dato de la columna
#     end
#     puts # salto a la siguiente fila
# end

datos.each do |fila|
    tabulador_col = 0
    fila.each do |columna|
        tabulador_col = tabulador_col > columna.length ? tabulador_col : columna
    end
    file.each do |columna|
        print "|#{columna.ljust(tabulador_col)}"
    end
    puts
end


# ESCRIBIR un archivo CSV ✍
#                       w: write (sobre escribe los datos anteriores)
#                       a: append (agrega nuevos valores al archivo actual)
CSV.open("usuarios.csv", "w") do |csv|
    #       nombre, ventas, edad, horas_trabajadas
    [].each do |dato|
    csv << ["Juan",     80, 21, 40]
        # csv << ["Camila",   10, 21, 80]
    end
end
