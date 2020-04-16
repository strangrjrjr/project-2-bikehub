class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:session][:username])
        if @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = "Incorrect username or password"
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end