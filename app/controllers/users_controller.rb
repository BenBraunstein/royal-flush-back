class UsersController < ApplicationController
    def create 
        user = User.create(strong_user_params)
        user.update(password: params[:password])
        user.update(rating: 1)
        render :json => user
    end

    private
    def strong_user_params
        params.require(:user).permit(:username)
    end
end
