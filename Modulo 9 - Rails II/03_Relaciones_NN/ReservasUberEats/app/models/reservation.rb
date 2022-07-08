class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :restaurant
end
