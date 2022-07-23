class Dog < ApplicationRecord
    has_many :animals, as: :breed
end
