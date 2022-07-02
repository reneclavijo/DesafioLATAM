class Category < ApplicationRecord
    has_many :movies, dependent: :destroy # plural
end
