class Banda < ApplicationRecord
    has_one_attached :logo
    has_many_attached :fotos
end
