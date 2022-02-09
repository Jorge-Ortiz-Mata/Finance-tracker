class SessionsController < ApplicationController

    def new
        user = User.new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user.present? && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Successfully sign up."
        else
            redirect_to signin_path, alert: "Invalid params. Try again."
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to signin_path, notice: "Successfully signed out."
    end

end
