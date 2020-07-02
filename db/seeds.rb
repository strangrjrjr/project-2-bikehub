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

# Users
10.times do
    User.create(username: Faker::Esport.unique.player, profile: "Bike gud", password: Faker::Internet.password)
end

# Bikes, pulled from BikeIndex API

bike_data = JSON.parse(RestClient.get("https://bikeindex.org:443/api/v3/search?page=1&per_page=20&location=IP&distance=10&stolenness=non"))
bike_data["bikes"].each do |bike|
    Bike.create(manufacturer_name: bike["manufacturer_name"], frame_model: bike["frame_model"], image_url: bike["thumb"])
end


# Associate bikes with users
20.times do
    UserBike.create(user_id: User.all.sample.id, bike_id: Bike.all.sample.id)
end

# Rides, pulled from OpenRouteService API
headers = {
  :accept => 'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8'
}

10.times do
    sleep(10)
    url = "https://api.openrouteservice.org/v2/directions/cycling-regular?api_key=5b3ce3597851110001cf62481452602599dc40f8992c06961d07d29b&start=-122.312#{rand(999)},47.724#{rand(999)}&end=-122.309#{rand(999)},47.662#{rand(999)}"

    ride_data = JSON.parse(RestClient.get(url))
    userbike = UserBike.all.sample
    Ride.create(user_id: userbike.user.id, bike_id: userbike.bike.id, distance: ride_data["features"][0]["properties"]["summary"]["distance"], duration: ride_data["features"][0]["properties"]["summary"]["duration"], map: url)
end

# Comments

20.times do
    user = User.all.sample
    ride = Ride.all.sample
    Comment.create(user_id: user.id, ride_id: ride.id, title: Faker::Quote.robin, content: Faker::Quote.most_interesting_man_in_the_world)
end

puts "SEEDS COMPLETE"
