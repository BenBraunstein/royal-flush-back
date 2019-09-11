class LocationsController < ApplicationController
    def index 
        locations = Location.all
        lat = request.headers['Latitude'].to_f
        long = request.headers['Longitude'].to_f
        sorted_locations = locations.sort_by {|location| Math.sqrt((lat - location.coords.split[1][0..-1].to_f)**2 + (long - location.coords.split[0][0..-2].to_f)**2)}
        render :json => sorted_locations[0..9]
    end

    def create 
        require "net/http"
        require "uri"
        uri = URI.parse("https://api.mapbox.com/geocoding/v5/mapbox.places/#{URI.escape(params[:address])}.json?access_token=#{ENV['MAPBOX_API_KEY']}")
        response = Net::HTTP.get_response(uri)
        body = JSON.parse(response.body)
        coords = body["features"][0]["center"].inspect.remove("[").remove("]")
        location = Location.create(strong_location_params)
        location.update(rating:1, coords: coords)
        render :json => location
        # self.index
    end

    private
    def strong_location_params
        params.require(:location).permit(:address, :capacity, :name, :price, :image)
    end
end
