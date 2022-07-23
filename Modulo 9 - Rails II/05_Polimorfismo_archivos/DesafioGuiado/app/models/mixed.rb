class Mixed < ApplicationRecord
    has_many :products, as: :category
end
