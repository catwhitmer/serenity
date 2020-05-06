class Massage < ApplicationRecord
    belongs_to :user
    has_many :appointments 
    has_many :users, through: :appointments
end
