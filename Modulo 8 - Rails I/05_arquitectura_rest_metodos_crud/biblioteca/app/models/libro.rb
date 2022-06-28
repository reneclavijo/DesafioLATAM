class Libro < ApplicationRecord
    enum estado: ["Prestado", "En estante"]
end
