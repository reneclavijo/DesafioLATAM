# ¿cómo usamos una API?
# - Podemos hacerlo a través de herramientas como Postman o Insomnia
# también por código
# - Existen muchos proyectos libres que habilitan una API para uso
# abierto, de investigación o diversión
# https://developer.vonage.com/blog/21/03/15/the-ultimate-list-of-fun-apis-for-your-next-coding-project 
# 
# GET
# obtener y transformar info
# POST
# Cabeceras, Cuerpo de una petición

# Probar API de monedas con CoinDesk 
# https://www.coindesk.com/tag/api/
# DOLAR
# https://s3.amazonaws.com/dolartoday/data.json 

# Utilidades propias de Ruby
# require "uri"
# require "net/http"
# require 'json'

# url = URI("https://api.coindesk.com/v1/bpi/historical/close.json")

# https = Net::HTTP.new(url.host, url.port)
# https.use_ssl = true

# request = Net::HTTP::Get.new(url)

# response = https.request(request)
# # puts response.read_body

# respuesta_json = JSON.parse(response.read_body)

# puts respuesta_json.class
# puts respuesta_json.count

# respuesta_json["bpi"].each do |fecha, valor|
#     puts "📆 #{fecha} -> #{valor}💲"
# end


# GEMA Faraday
require 'faraday'
require 'json'

# respuesta = Faraday.get('https://api.coindesk.com/v1/bpi/historical/close.json')

# puts respuesta.status
# puts respuesta.headers.class
# respuesta_json = JSON.parse(respuesta.body)
# respuesta_json["bpi"].each do |fecha, valor|
#     puts "📆 #{fecha} -> #{valor}💲"
# end

# Consumiendo la api de pokemon

# respuesta_pokemon = Faraday.get('https://pokeapi.co/api/v2/pokemon/pikachu')
# puts respuesta_pokemon.status
# pokemon_json = JSON.parse(respuesta_pokemon.body)

# pokemon_json["sprites"].each do |llave , valor|
#     puts "#{llave} : #{valor}"
# end


# https://lostisland.github.io/faraday/usage/
# response = Faraday.get('http://httpbingo.org')
# response.status
# response.headers
# response.body
# conn = Faraday.new(
#     url: 'http://httpbingo.org',
#     params: {param: '1'},
#     headers: {'Content-Type' => 'application/json'}
# )  
# response = conn.post('/post') do |req|
#     req.params['limit'] = 100
#     req.body = {query: 'chunky bacon'}.to_json
# end

=begin
NOTA Miguel....
reader.rb:2:in `block in <main>': uninitialized constant PDF (NameError)
	from reader.rb:1:in `open'
	from reader.rb:1:in `<main>'

File.open("APIs .pdf", "rb") do |io|
  reader = PDF::Reader.new(io)
  puts reader.info
end
    

=end

require 'pdf-reader'


reader = PDF::Reader.new("carta.pdf")
puts reader.pdf_version
#puts reader.info
#puts reader.metadata
puts reader.page_count

reader.pages.each do |page|
    puts page.text
  end

# /home/miguel/.rbenv/versions/2.6.9/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- pdf-reader (LoadError)
# 	from /home/miguel/.rbenv/versions/2.6.9/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# 	from reader.rb:1:in `<main>'

