class User < ApplicationRecord
    has_many :appointments 
    has_many :massages, through :appointments
end
