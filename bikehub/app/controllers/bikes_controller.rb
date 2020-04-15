class BikesController < ApplicationController

    def index
        @bikes = Bike.all
    end

    def new
        @bike = Bike.new
    end

    def create
        @bike = Bike.new(bike_params)
        if @bike.save
            redirect_to @bike
        else
            render :new
        end
    end

    def show
        @bike = Bike.find(params[:id])
    end

    def edit
        @bike = Bike.find(params[:id])
    end

    def update
        @bike = Bike.find(params[:id])
        if @bike.update(bike_params)
            redirect_to @bike
        else
            render :edit
        end
    end

    private

    def bike_params
        params.require(:bike).permit(:manufacturer_name, :frame_model, :image_url)
    end

end
