class Product < ApplicationRecord
    validates :name,    presence: true, uniqueness: true, length: { minimum: 3 }
    validates :brand,   presence: true
end
