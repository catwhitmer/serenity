class Appointment < ApplicationRecord
    belongs_to :user 
    belongs_to :massage

    validates :location, :date, :time, presence: true
end
