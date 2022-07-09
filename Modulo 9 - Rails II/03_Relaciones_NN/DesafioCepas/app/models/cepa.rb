class Cepa < ApplicationRecord
    has_many :ensamblajes
    has_many :vinos, through: :ensamblajes
end
