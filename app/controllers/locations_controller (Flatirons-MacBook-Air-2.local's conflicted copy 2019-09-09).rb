class LocationsController < ApplicationController
    def index 
        locations = Location.all
        allCoords = locations.map {|location| "#{location.coords.split[0][0..-2]},#{location.coords.coords.split[1][0..-1]}"}
        lat = request.headers['Latitude']
        long = request.headers['Longitude']
        uri = URI.parse("https://api.mapbox.com/directions-matrix/v1/mapbox/walking/#{long},#{lat};-78.869960,42.888526?sources=1&annotations=distance,duration&access_token=#{ENV["MAPBOX_API_KEY"]}")
        response = Net::HTTP.get_response(uri)
        body = JSON.parse(response.body)
        byebug
        render :json => locations
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
