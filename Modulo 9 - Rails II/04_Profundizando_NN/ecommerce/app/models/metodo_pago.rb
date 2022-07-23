class MetodoPago < ApplicationRecord
    has_many :pagos
    has_many :ordenes, through: :metodos_pago
end
