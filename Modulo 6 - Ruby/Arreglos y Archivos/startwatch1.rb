# DATOS DE ENTRADA
pasos = ['100', '21', '231as', '2031',
'1052000', '213b', 'b123']

# PROCESO

def clear_steps(arreglo)
    filtrados = []
    arreglo.each do |numero|
        # descarte todos los valores que no sean números
        n = numero.to_i
        unless(n < 200 || n > 100000)
            filtrados << n
        end
    end
    print filtrados
end

clear_steps(pasos)
# SALIDA
