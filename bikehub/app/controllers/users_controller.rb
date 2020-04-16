class UsersController < ApplicationController
    
    def welcome
        @rides = Ride.all
        render :welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        if @user.id == session[:user_id]
            @authorized = true
            @bike = Bike.new
            @ride = Ride.new
        else
            @authorized = false
        end
        @bikes = @user.bikes
        @rides = @user.rides
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(session[:user_id])
        # destroy all UserBike instances
        UserBike.select {|ub| ub.user_id == @user.id ? ub.destroy : nil}
        @user.destroy
        redirect_to root_path
    end

    def add_bike
        user_id = session[:user_id]
        bike = Bike.create(manufacturer_name: params[:bike][:manufacturer_name], frame_model: params[:bike][:frame_model], image_url: params[:bike][:image_url])
        UserBike.create(user_id: user_id, bike_id: bike.id)
        redirect_to user_path(user_id)
    end

    def add_ride
        user_id = session[:user_id]
        Ride.create(user_id: user_id, bike_id: params[:ride][:bike_id], description: params[:ride][:description], distance: params[:ride][:distance], duration: params[:ride][:duration], map: "")
    end

    private

    def user_params
        params.require(:user).permit(:username, :profile)
    end

end
