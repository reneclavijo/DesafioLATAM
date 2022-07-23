# Es posible que no todos los servicios
# estén disponibles con la gema de ruby
# si es así, hay que ir consumir la Api
# directamente
# https://www.transbankdevelopers.cl/referencia/webpay?l=http 
# https://www.transbankdevelopers.cl/referencia/webpay#webpay-plus
# ============== FORMULARIO DE VALIDACIÓN DEL NEGOCIO
# https://form.typeform.com/to/ibXdg6Av?typeform-medium=embed-snippet
# ==============
# INTEGRACIÓN
HOST =                        "https://webpay3gint.transbank.cl"
CODIGO_COMERCIO_WEBPAY_PLUS = "597055555532"
API_KEY_SECRET = "            579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C"
#?== TARJETAS DE CRÉDITO DE PRUEBA
# VISA 	4051 8856 0044 6623
# CVV 123
# cualquier fecha de expiración 	Genera transacciones aprobadas.
# AMEX 	3700 0000 0002 032
# CVV 1234
# cualquier fecha de expiración 	Genera transacciones aprobadas.
# MASTERCARD 	5186 0595 5959 0568
# CVV 123
# cualquier fecha de expiración 	Genera transacciones rechazadas.
# Redcompra 	4051 8842 3993 7763 	Genera transacciones aprobadas (para operaciones que permiten débito Redcompra)
# Redcompra 	4511 3466 6003 7060 	Genera transacciones aprobadas (para operaciones que permiten débito Redcompra)
# Redcompra 	5186 0085 4123 3829 	Genera transacciones rechazadas (para operaciones que permiten débito Redcompra)
# Prepago VISA 	4051 8860 0005 6590
# CVV 123
# cualquier fecha de expiración 	Genera transacciones aprobadas.
# Prepago MASTERCARD 	5186 1741 1062 9480
# CVV 123
# cualquier fecha de expiración 	Genera transacciones rechazadas.

#! Cuando aparece un formulario de autenticación con RUT y clave, se debe usar el RUT 11.111.111-1 y la clave 123.


# PRODUCCIÓN
HOST = "https://webpay3g.transbank.cl"