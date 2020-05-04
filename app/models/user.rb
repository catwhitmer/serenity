class User < ApplicationRecord
    has_secure_password
    has_many :appointments 
    has_many :massages, through :appointments

    validates :username, :email, presence: true 
    validates :username, uniqueness: true
end
