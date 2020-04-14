class User < ApplicationRecord
    has_many :user_bikes
    has_many :bikes, through: :user_bikes
    has_many :rides
    has_many :comments
end
