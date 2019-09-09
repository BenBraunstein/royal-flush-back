class LocationsController < ApplicationController
    def index 
        locations = Location.all
        lat = request.headers['Latitude'].to_f
        long = request.headers['Longitude'].to_f
        sorted_locations = locations.sort_by {|location| Math.sqrt((lat - location.coords.split[1][0..-1].to_f)**2 + (long - location.coords.split[0][0..-2].to_f)**2)}
        render :json => sorted_locations[0..10]
    end

    def create 
        location = Location.create(strong_location_params)
        location.update(rating:1)
        render :json => location
    end

    private
    def strong_location_params
        params.require(:location).permit(:address, :capacity, :name, :price, :image)
    end
end
