class CarrosController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_usuario!, except: :transaccion_efectiva_transbank

    def update
        producto = params[:carro][:producto_id]
        cantidad = params[:carro][:cantidad]

        orden_actual.agregar_producto(producto, cantidad)

        redirect_to root_url, notice: 'Producto agregado 🤑'
    end

    def show
        @orden = orden_actual
        @mostrar_pagos = @orden.total != 0
        if @mostrar_pagos
            servicio_transbank = ServicioPagoTransbank.new(@orden, transaccion_efectiva_transbank_carros_url)
            @resp = servicio_transbank.pagar
        end
    end

    # POST
    def pagar_con_paypal
        orden = Orden.find(params[:carro][:orden_id])
        servicio_paypal = ServicioPagoPaypal.new(orden, procesar_pago_paypal_carros_url, root_path)
        redirect_to servicio_paypal.pagar(request.remote_ip)
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

    # GET de Transbank    
    def transaccion_efectiva_transbank
        servicio_transbank = ServicioPagoTransbank.new
        @respuesta = servicio_transbank.confirmar(params[:token_ws])
        if @respuesta && @respuesta["status"].eql?("AUTHORIZED")
            @mensaje = "FELICIDADES"
            pago = Pago.find_by(token: params[:token_ws])
            pago.update(estado: "completado")
            orden_actual.update(estado: "completado")
        else
            # {"TBK_TOKEN"=>"[FILTERED]", "TBK_ORDEN_COMPRA"=>"PASTELERIA-COMPRA-9", "TBK_ID_SESION"=>"1403"}
            if params[:TBK_TOKEN] # CUANDO LA TRANSACCIÓN SE CANCELA
                @estado = servicio_transbank.consultar_estado(params[:TBK_TOKEN])
            else # CUANDO LA TARJETA DA ERROR
                @estado = servicio_transbank.consultar_estado(params[:token_ws])
            end
            pago = Pago.find_by(token: params["TBK_TOKEN"])
            pago.update(estado: "cancelado")
            @mensaje = "HUBO UN ERROR :( #{@estado.inspect}"
        end
    end
end
