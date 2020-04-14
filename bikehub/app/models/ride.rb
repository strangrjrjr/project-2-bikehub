class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :bike
    has_many :comments
end
