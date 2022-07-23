class Animal < ApplicationRecord
  belongs_to :breed, polymorphic: true
end
