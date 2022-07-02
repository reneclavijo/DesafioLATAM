class Movie < ApplicationRecord
  belongs_to :category # singular
  has_many :reviews
end
