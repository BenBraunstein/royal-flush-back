class AuthController < ApplicationController
    def login 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {
                username: user.username,
                token: JWT.encode({userId: user.id}, ENV['JWT_SECRET'])
            }
        else
            render json: {errors: "Invalid username, password combo"}
        end
    end

    def autologin
        token = request.headers['Authorization']
        if token != "undefined"
            user_id = JWT.decode(token, ENV["JWT_SECRET"])[0]["userId"]
            user = User.find(user_id)
            user_duties = user.duties.map {|duty| duty.location.name}.reverse.uniq
            render json: {
                user: user,
                user_duties: user_duties
            }
        else
            render json: {errors: "Invalid username, password combo"}
        end
    end
end
