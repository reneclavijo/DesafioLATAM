# Cómo definir HASH ¿para que sirven? (Llave - Valor) 
# h = {}
puntajes = { jugador1: 123, jugador2: 978, jugador3: 97 }

publicaciones = { 
    camkendell: "Todo lo que soñamos", 
    dereklaufman: "una tienda en la selva", 
    inktober: "Comienzo del reto" 
}







# notas = { "elmo": 1, "come galletas" => 4  } # uso del rocket
# pikachu = { 
#     vida: 50, 
#     ataques: {
#         trueno: 100, ataque_rapido: 30
#     } 
# }

# 1 = 2
# 1valor = 3
# $variable = {}


















# Hash vs Array

#               :procesador                :precio              :modelo
lenovo = { procesador: 'AMD Ryzen 7', precio: 3999901 , modelo: 'IdeaPad Gaming 3' }
puts "levono nuevo"
puts "modelo #{lenovo[:modelo]}"
puts "procesador #{lenovo[:procesador]}"
puts "PRECIO 💸 #{lenovo[:precio]}"
puts
#                    0                  1            2
lenovo_array = [ 'AMD Ryzen 7', 3999901 , 'IdeaPad Gaming 3']
puts "lenovo nuevo con array"
puts "modelo #{lenovo_array[2]}"
puts "procesador #{lenovo_array[0]}"
puts "precio 🤑 #{lenovo_array[1]}"





# :simbolos
# Los símbolos nos ayudan a optimizar la memoria

# NO SE PUEDEN DECLARAR ASÍ 🚫
# s = :23     🚫
# s = :1marca 🚫
# s = :%marca 🚫


# # cómo accedemos a los valores con las llaves
# puntajes = []
# # obtener solo las llaves, obtener solo los valores
# # Agregar/Eliminar(.delete) nuevos valores
# #recorrer un Hash .each ; 

# EJERCICIOS
# 2. Diccionario inglés - español
diccionario = {
Act: "Actuar",
Add:"Sumar",
Ask:"Preguntar",
Answer:"Responder",
Arrive:"Llegar",
Brush:"Cepillar",
Belong:"Pertenecer",
Beg:"Suplicar",
Believe:"Creer",
Close:"Cerrar",
Cook:"Cocinar",
Call:"Llamar",
Change:"Cambiar",
Charge:"Cargar",
Clean:"Limpiar",
Cry:"Llorar",
Dance:"Bailar",
Dress:"Vestir",
Die:"Morir",
Dry:"Secar",
Enjoy:"Disfrutar",
Explain: "Explicar",
Follow:"Seguir",
Finish:"Terminar",
Help:"Ayudar",
Hope:"Desear",
Happen:"Suceder",
Imagine:"Imaginar",
Kiss:"Besar"
}




# # Contar repetidos a partir de un arreglo
# # b.group_by{|x| x }.map{|k,v| [k, v.count] }.to_h

# # hacer el dibujo de la rutina para el Cómo programar
# # hacer el dibujo de la rutina para el Quiz
