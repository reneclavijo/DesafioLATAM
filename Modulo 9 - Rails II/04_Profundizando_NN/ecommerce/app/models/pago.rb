class Pago < ApplicationRecord
  belongs_to :orden
  belongs_to :metodo_pago
end
