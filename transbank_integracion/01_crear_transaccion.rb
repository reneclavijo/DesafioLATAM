require 'transbank/sdk'
require 'json'

codigo_orden_compra = "PASTELERIA-COMPRA-001"
sesion_id = "00001" # identificador de la sesión de pago de uso interno del comerio
monto = 10000
url_pagina_retorno = "http://localhost:3000/resumen_pago" # máximo de 256 caracteres

@tx = Transbank::Webpay::WebpayPlus::Transaction.new(::Transbank::Common::IntegrationCommerceCodes::WEBPAY_PLUS)
@resp = @tx.create(codigo_orden_compra, sesion_id, monto, url_pagina_retorno)

puts @resp.class
puts @resp["token"]
puts @resp["url"]

require 'erb'
plantilla = ERB.new <<-EOF
  <html>
    <body>
      <form action='<%= @resp["url"]%>' method=post>
        <input type="hidden" name="token_ws" value="<%=@resp["token"]%>" />
        <input type="submit" value="Ir a pagar" />
      </form>
    </body>
  </html>
EOF

File.open("pagar.html", "w") do |f|
   f << plantilla.result(binding)
end