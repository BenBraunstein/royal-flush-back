class LocationsController < ApplicationController
    def index 
        locations = Location.all 
        render :json => locations
    end

    def create 
        location = Location.create(strong_location_params, rating: 1)
        render :json => location
    end

    private
    def strong_location_params
        params.require(:location).permit(:address, :capacity, :name, :price, :image)
    end
end
