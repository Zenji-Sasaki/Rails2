class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room
    validates :how_many_people, presence: true
end
