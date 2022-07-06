class User < ApplicationRecord
    has_secure_password
    has_many :stories
    
    validates :name,                    presence: true
    validates :email,                   uniqueness: true, presence: true
    validates :password_confirmation,   presence: true
end
