class Cow < ApplicationRecord
    has_many :animals, as: :breed
end
