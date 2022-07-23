class DetalleOrden < ApplicationRecord
    belongs_to :producto
    belongs_to :orden
end