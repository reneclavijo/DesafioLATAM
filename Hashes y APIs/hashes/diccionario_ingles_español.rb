#DATOS DE ENTRADA
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

# Recuperando el valor a través de la llave 🔑
puts "Introducir una palabra en inglés"
palabra_a_buscar = gets.chomp.to_sym
puts "Introducir una palabra para buscar"
puts diccionario[palabra_a_buscar]

# Recuperando la llave 🔑 desde el valor
puts "Introducir una palabra en español"
verbo_en_español = gets.chomp
puts diccionario.invert[verbo_en_español]

imei = {
    samsung_galaxy10_LT01_01: 321456987,
    samsung_galaxy10_LT01_02: 321456988,
}

paises = {
    chile: "+56",
    colombia: "+57",
    bolivia: "+591"
}

dominios = {
    chile: '.cl',
    colombia: '.co',
    bolivia: '.bo',
    peru: '.pe'
}

personas = {
    R15963K: "fulanito de tal"
}
