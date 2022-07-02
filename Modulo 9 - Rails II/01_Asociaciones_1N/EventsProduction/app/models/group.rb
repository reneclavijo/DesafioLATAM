class Group < ApplicationRecord
    # Rails 6
    enum category: [:hombres, :mujeres, :banda]
    # Rails 7
    # enum :category, [:hombres, :mujeres, :banda]
    has_many :concerts, dependent: :destroy
end
