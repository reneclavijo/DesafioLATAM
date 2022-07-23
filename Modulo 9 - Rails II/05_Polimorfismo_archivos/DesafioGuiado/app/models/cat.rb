class Cat < ApplicationRecord
    has_many :animals, as: :breed
end
