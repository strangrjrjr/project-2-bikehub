class Bike < ApplicationRecord
    has_many :user_bikes, dependent: :destroy
    has_many :users, through: :user_bikes
    has_many :rides
end
