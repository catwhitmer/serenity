class Appointment < ApplicationRecord
    belongs_to :user 
    belongs_to :massage

    validates :location, :date, :time, presence: true

    scope :find_massage, -> { where(length: "90") }
end
