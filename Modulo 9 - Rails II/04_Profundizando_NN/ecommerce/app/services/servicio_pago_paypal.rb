class ServicioPagoPaypal
    def initialize(orden, url_afirmacion, url_cancelacion)
        @orden = orden
        @url_afirmacion     = url_afirmacion
        @url_cancelacion    = url_cancelacion
    end

    def pagar(ip_remota)

        respuesta = EXPRESS_GATEWAY.setup_purchase(
            @orden.total,
            ip: ip_remota,
            return_url: @url_afirmacion,
            cancel_return_url: @url_cancelacion,
            allow_guest_checkout: true,
            currency: "USD"
        )
        metodo_pago = MetodoPago.find_by(codigo: "PEC")
        
        Pago.create(
            orden_id: @orden.id,
            metodo_pago_id: metodo_pago.id,
            estado: "procesando",
            total: @orden.total,
            token: respuesta.token
        )
        return EXPRESS_GATEWAY.redirect_url_for(respuesta.token)
    end

end
