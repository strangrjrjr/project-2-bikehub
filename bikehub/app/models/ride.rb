class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :bike
    has_many :comments

    def longest_ride
        longest = Ride.maximum(:duration).id

        longest_ride = Ride.all.find(longest)

    end

    def fastest_ride
    
    end

    def most_rides

    end
end
