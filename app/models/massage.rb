class Massage < ApplicationRecord
    has_many :appointments 
    has_many :users, through: :appointments

    validates :category, :length, presence: true

    scope :recent, -> { order(created_at: :desc) }
    scope :search_by_length, ->(length) {where("length = ?", length) }
end
