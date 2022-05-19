# Escribir un programa llamado patrones.rb con métodos que reciban la cantidad de líneas y
# muestren por pantalla los siguientes patrones de *:


# ENTRADA 
lineas = ARGV[0].chomp.to_i # El número de líneas

# PROCESO
## CASOD  DE PRUEBA 5
mitad = lineas / 2
pintar_base = false

lineas.times do |fila|
    lineas.times  do |columna|
        if fila <= mitad 
            # COPA
            operacion = (mitad - columna).abs
            if operacion <= fila # 0 <= 1
                if operacion.even? and fila.even? # PAR
                    print '*'           
                elsif operacion.odd? and fila.odd?# IMPAR
                    print "*"
                else
                    print ' '
                end
            else
                print ' '
            end
        else
            # BASE
            if fila < (lineas - 1)
                # DIBUJAR EL TRONCO
                if (mitad - columna).abs == 0
                    print '*'
                else
                    print ' '
                end
            else
                # DIBUJAR LA BASE
                if pintar_base == true
                    print '*'
                    pintar_base = false
                else
                    print ' '
                    pintar_base = true
                end
            end
        end
    end
    puts
end


# SALIDA
#    *          1
#   * *         2
#  * * *        3       
# * * * *       4
#    *          5
#    *          6
#  * * *        7
