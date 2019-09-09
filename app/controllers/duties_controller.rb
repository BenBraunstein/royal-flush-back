class DutiesController < ApplicationController
    def create
        user = User.find(JWT.decode(params[:token], ENV["JWT_SECRET"])[0]["userId"])
        duty = Duty.create(location_id:params[:location_id], user_id: user.id, complete: false)
        duty.update(user_id: user.id, complete: false)
        render json: duty
    end

    def update
        duty = Duty.find(params[:id])
        location = duty.location
        duty.update(locations_rating: params[:rating])
        relevant_duties = Duty.where(location_id: location.id)
        new_rating = relevant_duties.average(:locations_rating)
        location.update(rating: new_rating)

        render json: location
    end

    private
    def strong_duty_params
        params.require(:duty).permit(:location_id)
    end
end
