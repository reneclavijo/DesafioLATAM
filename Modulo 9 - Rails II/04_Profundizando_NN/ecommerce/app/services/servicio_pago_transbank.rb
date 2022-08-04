class ServicioPagoTransbank
    def initialize(orden = nil, url_retorno = "")
        @orden = orden
        @url_retorno = url_retorno
        @tx = Transbank::Webpay::WebpayPlus::Transaction.new(::Transbank::Common::IntegrationCommerceCodes::WEBPAY_PLUS)
    end

    def pagar()
        codigo_orden_compra = "PASTELERIA-COMPRA-#{Orden.count+1}"
        sesion_id = rand(1000..2000).to_s # identificador de la sesión de pago de uso interno del comerio
        monto = @orden.total
        url_pagina_retorno = @url_retorno
        transaccion = @tx.create(codigo_orden_compra, sesion_id, monto, @url_retorno)
        # GUARDAR EL TOKEN EN LA BD
        metodo_pago = MetodoPago.find_by(codigo: "TBK")
        Pago.create(
            orden_id: @orden.id,
            metodo_pago_id: metodo_pago.id,
            estado: "procesando",
            total: @orden.total,
            token: transaccion["token"]
        )
        return transaccion
    end

    def confirmar(token)
        return @tx.commit(token)
    rescue => e
        puts "ERROR DE TRANSBANK...#{e}"
        nil
    end

    def consultar_estado(token)
        return @tx.status(token)
    rescue => e
        puts "ERROR DE TRANSBANK CON ESTADO...#{e}"
        nil
    end

end