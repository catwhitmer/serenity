class Appointment < ApplicationRecord
    belongs_to :user 
    belongs_to :massage

    validates :locaton, :date, :time, presence: true
end
