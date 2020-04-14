# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Bike.destroy_all
UserBike.destroy_all
Ride.destroy_all
Comment.destroy_all

10.times do
    User.create(username: Faker::Esport.unique.player, profile: "Bike gud")
end

20.times do
    bike_data = JSON.parse(RestClient.get("https://bikeindex.org:443/api/v3/search?page=1&per_page=20&location=IP&distance=10&stolenness=non"))
    bike_data["bikes"].each do |bike|
        Bike.create(manufacturer_name: bike["manufacturer_name"], frame_model: bike["frame_model"], image_url: bike["thumb"])
    end
end

20.times do
    UserBike.create(user_id: User.all.sample.id, bike_id: Bike.all.sample.id)
end
