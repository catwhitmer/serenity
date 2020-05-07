class Massage < ApplicationRecord
    has_many :appointments 
    has_many :users, through: :appointments

    validates :category, :length, presence: true
end
