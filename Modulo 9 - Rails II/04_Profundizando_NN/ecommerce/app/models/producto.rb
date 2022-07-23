class Producto < ApplicationRecord
    has_and_belongs_to_many :categorias

    has_many :detalles_ordenes
    has_many :ordenes, through: :detalles_ordenes
end
