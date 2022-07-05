class User < ApplicationRecord
    has_secure_password
    has_many :stories
    
    validates :email, uniqueness: true
end
