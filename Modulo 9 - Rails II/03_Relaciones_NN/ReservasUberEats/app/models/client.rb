class Client < ApplicationRecord
    has_many :reservations
    has_many :restaurants, through: :reservations
end
