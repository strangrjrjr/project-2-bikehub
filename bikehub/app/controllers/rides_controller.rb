class RidesController < ApplicationController
    def index
        @rides = Ride.all
    end

    def new
        @ride = Ride.new
    end

    def create
        @ride = Ride.new(ride_params)
        if @ride.save
            redirect_to @ride
        else
            render :new
        end
    end

    def show
        @ride = Ride.find(params[:id])
        @user = User.find(@ride.user_id)
        @bike = Bike.find(@ride.bike_id)
    end

    # def edit
    #     @ride = Ride.find(params[:id])
    # end

    # def update
    #     @ride = Ride.find(params[:id])
    #     if @ride.update(ride_params)
    #         redirect_to @ride
    #     else
    #         render :edit
    #     end
    # end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :bike_id, :description, :distance, :duration, :map)
    end

end
