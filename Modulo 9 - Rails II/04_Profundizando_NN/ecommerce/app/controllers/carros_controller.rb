class CarrosController < ApplicationController
    before_action :authenticate_usuario!
    def update
        producto = params[:carro][:producto_id]
        cantidad = params[:carro][:cantidad]

        orden_actual.agregar_producto(producto, cantidad)

        redirect_to root_url, notice: 'Producto agregado 🤑'
    end
    def show
        @orden = orden_actual
        # TRANSBANK TEMP
        @codigo_orden_compra = "PASTELERIA-COMPRA-001"
        @sesion_id = "00001" # identificador de la sesión de pago de uso interno del comerio
        @monto = 50000
        #@url_pagina_retorno = "http://localhost:3000/resumenes"
        @url_pagina_retorno = procesar_pago_paypal_carro_url
    
        @tx = Transbank::Webpay::WebpayPlus::Transaction.new(::Transbank::Common::IntegrationCommerceCodes::WEBPAY_PLUS)
        @resp = @tx.create(@codigo_orden_compra, @sesion_id, @monto, @url_pagina_retorno)
    
    end

    # POST
    def pagar_con_paypal
        orden = Orden.find(params[:carro][:orden_id])
        #price must be in cents
        price = 100
        # Aqui llamamos al express gateway que definimos al inicializar
        # que definimos en nuestro archivo config/development.rb y
        # preparamos la compra, donde se nos devolverá un token para
        # identificar esta venta en particular
        response = EXPRESS_GATEWAY.setup_purchase(price,
            ip: request.remote_ip,
            return_url: procesar_pago_paypal_carro_url,
            cancel_return_url: root_url,
            allow_guest_checkout: true,
            currency: "USD"
        )
        payment_method = MetodoPago.find_by(codigo: "PEC")
        # Aquí creamos nuestro registro en la tabla Payment con el
        # payment method de Paypal, y con estado “processing” pues aún
        # está en proceso
        Pago.create(
            orden_id: orden.id,
            metodo_pago_id: payment_method.id,
            estado: "processing",
            total: orden.total,
            token: response.token
        )
        # redirigimos al usuario a Paypal, para que realice el pago
        redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    end
    
    # GET
    def procesar_pago_paypal
        # details = EXPRESS_GATEWAY.details_for(params[:token])
        # express_purchase_options =
        # {
        #     ip: request.remote_ip,
        #     token: params[:token],
        #     payer_id: details.payer_id,
        #     currency: "USD"
        # }
        # price = details.params["order_total"].to_d * 100
        # response = EXPRESS_GATEWAY.purchase(price, express_purchase_options)
        # if response.success?
        #     payment = Pago.find_by(token: response.token)
        #     order = payment.orden
        #     #update object states
        #     payment.estado = "completed"
        #     order.estado = "completed"
        #     ActiveRecord::Base.transaction do
        #         order.save!
        #         payment.save!
        #     end
        # end
    end
end
