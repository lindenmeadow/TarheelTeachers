class SessionsController < ApplicationController
    def new
    end

    def create
        if auth 
            if @user = User.find_by(:email => auth["info"]["email"])
              session[:user_id] = @user.id
              redirect_to root_path, flash:{notice: "You are now signed in."}
            else
              redirect_to 'users#new', flash:{alert: "User not found. Please sign up first."}
            end
          else
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
              session[:user_id] = @user.id
              redirect_to root_path, flash:{notice: "You are now signed in."}
            else
              redirect_to signin_path, flash:{notice: "Invalid credentials. Please try again"}
            end
          end
    end

    def destroy
        session.clear
        redirect_to signin_path, flash:{notice: "You are now signed out."}
    end


    private

    def auth
        request.env['omniauth.auth']
    end
    
end
