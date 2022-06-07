##* Ejercicios: Chateando
require_relative 'residente'
require_relative 'mensaje'
require_relative 'casa'

# Creando las casas del condominio
casaA1 = Casa.new("A1")
casaA2 = Casa.new("A2")
casaA3 = Casa.new("A3")
casaA4 = Casa.new("A4")
casaA5 = Casa.new("A5")
casaB1 = Casa.new("B1")
casaB2 = Casa.new("B2")
casaB3 = Casa.new("B3")
casaB4 = Casa.new("B4")
casaB5 = Casa.new("B5")
casaC1 = Casa.new("C1")
casaC2 = Casa.new("C2")
casaC3 = Casa.new("C3")
casaC4 = Casa.new("C4")
casaC5 = Casa.new("C5")

# karla y germán
residente1 = Residente.new("Karla", "8888", casaA1)
residente2 = Residente.new("German", "7777", casaC5)
residente3 = Residente.new("Rodrigo", "9999", casaB1)

mensaje_prueba = Mensaje.new
mensaje_prueba.de         = residente1 # Karla
mensaje_prueba.para       = residente2 # German
mensaje_prueba.contenido  = "Hola Mundo"

mensaje_prueba2 = Mensaje.new
mensaje_prueba2.de         = residente3 # Rodrigo
mensaje_prueba2.para       = residente2 # German
mensaje_prueba2.contenido  = "Ando en clases"

mensaje_prueba3 = Mensaje.new
mensaje_prueba3.de         = residente1 # Karla
mensaje_prueba3.para       = residente2 # German
mensaje_prueba3.contenido  = "Adios"

# Enviar el mensaje
residente2.recibir_mensaje(mensaje_prueba)
residente2.recibir_mensaje(mensaje_prueba2)
residente2.recibir_mensaje(mensaje_prueba3)
residente2.imprimir_mensajes

