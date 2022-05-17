require 'json'
require 'faraday'

def request(url, api_key)
    # 👇 Recibir la respuesta
    respuesta = Faraday.get(url + api_key) # Enviar
    json = JSON.parse(respuesta.body) # 👈 transformar texto de respuesta a HASH
end

# datos de entrada
url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key="
api_key = "qbCMbuRmNXwGpaBc9JFV0lXzly02DkR78JzFDYgQ"




# Crear un método llamado build_web_page que reciba el hash de respuesta con todos
# los datos y construya una página web. Se evaluará la página creada y tiene que tener
# este formato:

# ENTRADA
# hash de respuesta ???? qué respuesta?
respuesta_hash = request(url, api_key)

# PROCESO
# ¿qué tengo que hacer con el hash para pasarlo a la página web?
# ¿qué contiene el hash y cómo está ordenado para poder obtener lo que necesito?
respuesta_hash['photos'].each do |elemento|
    puts elemento['img_src']
end



# SALIDA
# construir la página web.... ¿cómo que construir?
# tiene que tener un formato
# <html>
# <head>
# </head>
# <body>
# <ul>
# <li><img src='.../398380645PRCLF0030000CC AM04010L1.PNG'></li>
# <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
# </ul>
# </body>
# </html>
