require 'bcrypt'

class User < ApplicationRecord
    include BCrypt

    has_secure_password

    has_many :user_bikes, dependent: :destroy
    has_many :bikes, through: :user_bikes
    has_many :rides
    has_many :comments

end
