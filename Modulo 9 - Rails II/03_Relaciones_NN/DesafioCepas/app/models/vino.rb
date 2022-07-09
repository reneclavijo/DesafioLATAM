class Vino < ApplicationRecord
    has_many :ensamblajes
    has_many :cepas, through: :ensamblajes
    
    accepts_nested_attributes_for :ensamblajes
end
