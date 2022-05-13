# Arreglos dentro de arreglos

#posición:              0           1           2                       
palo_espada =       [['A', '♠'], ['2', '♠'], ['3', '♠']]
palo_corazones =    [['A', '♥'], ['2', '♥'], ['3', '♥']]

palo_espada.each do |carta|
    carta.each do |valor|
        print "#{valor}🃏"
    end
    puts
end

# Viendo como MATRIZ
matriz = [
# col: 0
    ['0,0', '0,1', '0,2', '0,3' ], # fila 0
    ['1,0', '1,1', '1,2', '1,3' ],
    ['2,0', '2,1', '2,2', '2,3' ],
    ['3,0', '3,1', '3,2', '3,3' ],
]

matriz.each do |fila|
    fila.each do |columna|
        print "| #{columna} |"
    end
    puts
end

