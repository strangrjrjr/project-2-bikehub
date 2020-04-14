# README

## Models

### User

    has_many :user_bikes
    has_many :bikes, through: user_bikes
    has_many :rides
    has_many :comments

    - id: int
    - username: string
    - password: string (wait for now; add column later)
    - profile: text
    - profile_photo (reach, requires different software)

### Bike

    has_many :user_bikes
    belongs_to :user, through: :user_bikes
    has_many :rides

    - id: int
    - manufacturer_name: string
    - frame_model: string
    - image_url: string

### Ride

    belongs_to :user
    belongs_to :bike
    has_many :comments

    - id: int
    - userbike_id: int
    - description: text
    - distance: int
    - elevation_gain: float
    - map: string (polyline map)

### UserBike

    belongs_to :user
    belongs_to :bike

    - id: int
    - user_id: int
    - bike_id: int

### Comment

    belongs_to :ride
    belongs_to :user

    - id: int
    - user_id: int
    - ride_id: int
    - title: string
    - content: text
