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
fotos = respuesta_hash['photos'].map do |elemento|
    elemento['img_src']
end


# SALIDA

# ¿cómo crear   un archivo HTML desde Ruby?
# ¿cómo crear   un archivo desde Ruby? que diga Hola Mundo
# ¿cómo podemos dar un formato específico para un archivo en ruby?
# ¿cómoo puedoh chrapcre rm parar imprimifr varias filas con Enter


# ¿cómo paso el formato HTML con etiquetas que me piden al archivo que ya tengo?

archivo = File.open('index.html', 'w')
archivo.write "<html>       \n
<head>       \n
</head>      \n
<body>       \n
    <ul style='list-style: none; display: inline;'>       \n"
            fotos.each do |foto|
                archivo.write "<li style='width: 10%; display: inline-block;'> \n"
                archivo.write "<img style='width: 100%;' src= #{foto} /> \n"
                archivo.write "<li/>      \n"
            end
archivo.write "
    <ul/>      \n
<body/>      \n
/html>      \n"
archivo.close
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



# ========================== EMERSON =========================
# 
require 'uri'
require 'net/http'
require 'json'
def request(url, api_key = "CfzfJb3cB9vSrdpm8VUMipSDcfmSFG1n0XLneNGu")
  url = URI("#{url}&api_key=#{api_key}")
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  request = Net::HTTP::Get.new(url)
  response = https.request(request)
  return JSON.parse(response.body)

end
data1 = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1&api_key")
data2 = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=100&api_key")
# data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10")

# ------------ solución 2 -----------------------------

def build_web_page(data1)
  photos = data1['photos'].map{|x| [x['img_src'], x['camera']['full_name']] }
  

  output = "<html>\n
  <head>\n
    <!-- CSS only -->
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css' integrity='sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn' crossorigin='anonymous'>\n
    <link rel='stylesheet' href='style.css'>\n
  </head>\n
  <body class='bg bg-success'>\n
  <h1 class='text-center'> fotos nasa </h1>\n
  <div class='container'>\n
  <div class='row row-cols-1 row-cols-md-4'>\n"
      photos.each do |photo|
        
        output += "\n\t
        <div class='col mb-4'>\n
        <div class = 'card'>\n 
          <img src='#{photo[0]}' class='card-img-top'>\n
          <h4> #{photo[1]} </h4>
        </div>\n
        </div>\n"
        
        
      end
      output += "\n
    </div>\n
  </div>\n
    
      <!-- JavaScript Bundle with Popper -->
      <script src='https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js' integrity='sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj' crossorigin='anonymous'></script>\n
      <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js' integrity='sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF' crossorigin='anonymous'></script>\n
      
      </body>\n
      </html>"
      File.write('output.html', output)
      
end
  build_web_page(data2)

# ------------ solución 3 ------------------------------

def photos_count(data)
  data['photos'].map{|x| x['camera']['name']}.group_by {|x| x}.map{|k,v|
  [k, v.count]}
end
  photos_count(data1)
