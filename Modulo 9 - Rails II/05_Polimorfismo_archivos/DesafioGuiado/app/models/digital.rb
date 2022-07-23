class Digital < ApplicationRecord
    has_many :products, as: :category
end
