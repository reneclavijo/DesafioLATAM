class Physical < ApplicationRecord
    has_many :products, as: :category
end
