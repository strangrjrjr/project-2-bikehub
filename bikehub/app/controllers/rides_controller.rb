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
        if session[:user_id]
            @comment = Comment.new
        end
    end

    def ride_comment
        user_id = session[:user_id]
        Comment.create(user_id: session[:user_id], ride_id: params[:id], title: params[:comment][:title], content: params[:comment][:content])
        redirect_to ride_path(params[:id])
        
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :bike_id, :description, :distance, :duration, :map)
    end

end
