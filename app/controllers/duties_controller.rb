class DutiesController < ApplicationController
    def recent_duties
        your_duties = User.find(params[:id]).duties
        recent_duties = your_duties[-1..-6]
        render json: recent_duties
    end

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
        if !new_rating
            render json: {
                errors: "Guess you dont wanna rate... aight"
            }
        elsif new_rating > 5
            new_rating = 5
            location.update(rating: new_rating)
        elsif new_rating < 1
            new_rating = 1
            location.update(rating: new_rating)
        end

        render json: location
    end

    private
    def strong_duty_params
        params.require(:duty).permit(:location_id)
    end
end
