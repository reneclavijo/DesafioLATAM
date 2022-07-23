class Product < ApplicationRecord
  belongs_to :category, polymorphic: true
end
