class Restaurant < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many :reservations
    has_many :clients, through: :reservations
end
